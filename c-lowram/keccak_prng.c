/*
 * Keccak256-based PRNG Implementation
 * ==================================
 *
 * This file implements a cryptographically secure pseudorandom number generator
 * based on Keccak-256. The design follows a stateful model similar to
 * SHAKE256 but uses a counter-based approach for expandable output generation.
 *
 * Design Overview:
 * ---------------
 * 1. State Management:
 *    - Maintains a 32-byte state derived from input data
 *    - Uses a 64-bit counter for expandable output
 *    - Includes a buffer for accumulating input before finalization
 *    - Maintains an output buffer to store unused random bytes
 *
 * 2. Operation Phases:
 *    a) Input Phase (before finalization):
 *       - Accumulate arbitrary input data into buffer
 *       - Can receive multiple inputs through inject function
 *
 *    b) Finalization Phase:
 *       - Processes all input using Keccak-256 to create initial state
 *       - Locks further input
 *
 *    c) Output Phase (after finalization):
 *       - Uses buffered output when available to reduce hash operations
 *       - Generates new blocks using counter mode when buffer is empty
 *       - Each block combines state and counter through Keccak-256
 */
// THIS FILE IS TAKEN FROM https://github.com/zhenfeizhang/falcon-go/blob/main/c/keccak256.c

#include <stdint.h>
#include <string.h>
#include "keccak256.h"
#include "keccak_prng.h"

/**
 * Initialize a Keccak256 PRNG context.
 */
int inner_keccak256_init(inner_keccak256_prng_ctx *sc)
{
    if (!sc)
        return -1;

    memset(sc->state, 0, KECCAK256_OUTPUT);
    sc->counter = 0;
    sc->finalized = 0;

    // Initialize absorption context
    keccak_init(&sc->absorb_ctx);

    // Initialize output buffer
    sc->out_buffer_pos = 0;
    sc->out_buffer_len = 0;

    return 0;
}

/**
 * Inject (absorb) data into the PRNG state.
 */
int inner_keccak256_inject(inner_keccak256_prng_ctx *sc, const uint8_t *in, size_t len)
{
    if (!sc || !in)
        return -1;
    if (sc->finalized)
        return -2;

    // Stream input directly into Keccak context
    keccak_update(&sc->absorb_ctx, in, len);
    return 0;
}

/**
 * Finalize the PRNG state and prepare for output generation.
 */
int inner_keccak256_flip(inner_keccak256_prng_ctx *sc)
{
    if (!sc)
        return -1;
    if (sc->finalized)
        return -2;

    // Finalize absorption -> seed state
    keccak_final(&sc->absorb_ctx, sc->state);

    sc->finalized = 1;

    // Reset output buffer
    sc->out_buffer_pos = 0;
    sc->out_buffer_len = 0;

    return 0;
}

/**
 * Generate pseudorandom output from the PRNG.
 */
int inner_keccak256_extract(inner_keccak256_prng_ctx *sc, uint8_t *out, size_t len)
{
    if (!sc || !out)
        return -1;
    if (!sc->finalized)
        return -2;

    size_t offset = 0;

    // First, use any bytes remaining in the output buffer
    if (sc->out_buffer_len > sc->out_buffer_pos)
    {
        size_t available = sc->out_buffer_len - sc->out_buffer_pos;
        size_t to_copy = (len < available) ? len : available;

        memcpy(out, sc->out_buffer + sc->out_buffer_pos, to_copy);
        sc->out_buffer_pos += to_copy;
        offset += to_copy;

        if (offset == len)
        {
            return 0; // Done
        }
    }

    // Generate additional blocks as needed
    uint8_t block[KECCAK256_OUTPUT + 8]; // state || counter
    SHA3_CTX keccak_ctx;

    while (offset < len)
    {
        // Prepare input block: state || counter
        memcpy(block, sc->state, KECCAK256_OUTPUT);
        for (int i = 0; i < 8; i++)
        {
            block[KECCAK256_OUTPUT + i] = (sc->counter >> (56 - i * 8)) & 0xFF;
        }

        // Generate next block using Keccak-256
        keccak_init(&keccak_ctx);
        keccak_update(&keccak_ctx, block, KECCAK256_OUTPUT + 8);
        keccak_final(&keccak_ctx, sc->out_buffer);

        sc->out_buffer_len = KECCAK256_OUTPUT;
        sc->out_buffer_pos = 0;

        size_t remaining = len - offset;
        size_t to_copy = (remaining < KECCAK256_OUTPUT) ? remaining : KECCAK256_OUTPUT;

        memcpy(out + offset, sc->out_buffer, to_copy);
        sc->out_buffer_pos = to_copy;
        offset += to_copy;

        sc->counter++;
    }

    return 0;
}