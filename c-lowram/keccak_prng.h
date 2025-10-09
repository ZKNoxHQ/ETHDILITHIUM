#include <stdint.h>
#include <string.h>
#include "keccak256.h"

#define KECCAK256_OUTPUT 32

typedef struct inner_keccak256_prng_ctx
{
    uint8_t state[KECCAK256_OUTPUT]; // Current state
    uint64_t counter;                // Output counter
    int finalized;                   // Flag indicating if state is finalized
    SHA3_CTX absorb_ctx;             // running Keccak context for inject()

    // New output buffer fields
    uint8_t out_buffer[KECCAK256_OUTPUT]; // Buffer for unused random bytes
    size_t out_buffer_pos;                // Current position in output buffer
    size_t out_buffer_len;                // Number of valid bytes in output buffer
} inner_keccak256_prng_ctx;

int inner_keccak256_init(inner_keccak256_prng_ctx *ctx);
int inner_keccak256_inject(inner_keccak256_prng_ctx *ctx, const uint8_t *data, size_t len);
int inner_keccak256_flip(inner_keccak256_prng_ctx *ctx);
int inner_keccak256_extract(inner_keccak256_prng_ctx *ctx, uint8_t *out, size_t outlen);
