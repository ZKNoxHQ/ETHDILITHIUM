// THIS FILE IS TAKEN FROM https://github.com/zhenfeizhang/falcon-go/blob/main/c/keccak256.c
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include "../keccak_prng.h"

void print_hex(const uint8_t *data, size_t len);

void print_hex(const uint8_t *data, size_t len)
{
    for (size_t i = 0; i < len; i++)
    {
        printf("%02x", data[i]);
    }
    printf("\n");
}

void test_unified_basic_functionality(void);

void test_unified_basic_functionality()
{
    printf("Test: Unified Basic Functionality\n");

    printf("Using: Keccak256 PRNG\n");

    inner_keccak256_prng_ctx ctx;
    uint8_t input[] = "test input";
    uint8_t output1[32];
    uint8_t output2[32];

    // Test 1: Same input should generate same output
    inner_keccak256_init(&ctx);
    inner_keccak256_inject(&ctx, input, strlen((char *)input));
    inner_keccak256_flip(&ctx);
    inner_keccak256_extract(&ctx, output1, 32);

    inner_keccak256_prng_ctx ctx2;
    inner_keccak256_init(&ctx2);
    inner_keccak256_inject(&ctx2, input, strlen((char *)input));
    inner_keccak256_flip(&ctx2);
    inner_keccak256_extract(&ctx2, output2, 32);

    printf("Output 1: ");
    print_hex(output1, 32);
    printf("Output 2: ");
    print_hex(output2, 32);

    assert(memcmp(output1, output2, 32) == 0);
    printf("PASSED: Same input generates same output\n");
}

void test_unified_different_lengths(void);

void test_unified_different_lengths()
{
    printf("\nTest: Different Output Lengths\n");

    inner_keccak256_prng_ctx ctx;
    uint8_t input[] = "test input";
    uint8_t output32[32];
    uint8_t output64[64];

    inner_keccak256_init(&ctx);
    inner_keccak256_inject(&ctx, input, strlen((char *)input));
    inner_keccak256_flip(&ctx);
    inner_keccak256_extract(&ctx, output32, 32);
    inner_keccak256_extract(&ctx, output64, 64);

    printf("32-byte output: ");
    print_hex(output32, 32);
    printf("First 32 bytes of 64-byte output: ");
    print_hex(output64, 32);

    assert(memcmp(output32, output64, 32) != 0);
    printf("PASSED: Different length outputs are unique\n");
}

void test_unified_incremental_injection(void);

void test_unified_incremental_injection()
{
    printf("\nTest: Incremental Injection\n");

    inner_keccak256_prng_ctx ctx1, ctx2;
    uint8_t input1[] = "test";
    uint8_t input2[] = "input";
    uint8_t output1[32];
    uint8_t output2[32];

    // Inject in one go
    inner_keccak256_init(&ctx1);
    inner_keccak256_inject(&ctx1, (uint8_t *)"testinput", 9);
    inner_keccak256_flip(&ctx1);
    inner_keccak256_extract(&ctx1, output1, 32);

    // Inject incrementally
    inner_keccak256_init(&ctx2);
    inner_keccak256_inject(&ctx2, input1, 4);
    inner_keccak256_inject(&ctx2, input2, 5);
    inner_keccak256_flip(&ctx2);
    inner_keccak256_extract(&ctx2, output2, 32);

    printf("Single injection output: ");
    print_hex(output1, 32);
    printf("Incremental injection output: ");
    print_hex(output2, 32);

    assert(memcmp(output1, output2, 32) == 0);
    printf("PASSED: Incremental injection matches single injection\n");
}

void test_unified_sequence(void);

void test_unified_sequence()
{
    printf("\nTest: Output Sequence\n");

    inner_keccak256_prng_ctx ctx;
    uint8_t input[] = "test sequence";
    uint8_t output1[16];
    uint8_t output2[16];
    uint8_t output3[16];

    inner_keccak256_init(&ctx);
    inner_keccak256_inject(&ctx, input, strlen((char *)input));
    inner_keccak256_flip(&ctx);

    inner_keccak256_extract(&ctx, output1, 16);
    inner_keccak256_extract(&ctx, output2, 16);
    inner_keccak256_extract(&ctx, output3, 16);

    printf("Sequence 1: ");
    print_hex(output1, 16);
    printf("Sequence 2: ");
    print_hex(output2, 16);
    printf("Sequence 3: ");
    print_hex(output3, 16);

    // Outputs should all be different
    assert(memcmp(output1, output2, 16) != 0);
    assert(memcmp(output2, output3, 16) != 0);
    assert(memcmp(output1, output3, 16) != 0);
    printf("PASSED: Sequential outputs are unique\n");
}

void test_python(void);

void test_python()
{
    // KeccakPRNG with input `` outputs twice 32 bytes:
    uint8_t input[] = {0xcc, 0x50, 0x1e, 0x9f, 0x47, 0x1a, 0x0, 0x4d, 0x2d, 0x3f, 0x60, 0x89, 0x4d, 0x12, 0xaa, 0xd3, 0x11, 0x4e, 0x8a, 0xbf, 0x62, 0xe4, 0x13, 0xa8, 0x0, 0xb7, 0xe7, 0x98, 0x7e, 0xc5, 0x10, 0xb};
    uint8_t out_1[32] = {
        0xEE, 0x96, 0x3D, 0x96, 0x24, 0x7F, 0xE3, 0xCD,
        0x9B, 0x73, 0xCA, 0x5C, 0xB6, 0x5B, 0x98, 0x09,
        0xF8, 0x8D, 0x3F, 0x6B, 0x9F, 0x94, 0x06, 0x28,
        0x5A, 0x83, 0x63, 0x63, 0xCD, 0xB7, 0x55, 0xAA};

    uint8_t out_2[32] = {
        0x20, 0xFF, 0x2C, 0xB8, 0x50, 0x8E, 0x6A, 0x68,
        0xF1, 0x54, 0x1E, 0x0B, 0x52, 0x20, 0xDF, 0x38,
        0xF5, 0x13, 0x4A, 0x4A, 0xB4, 0xBF, 0x29, 0x3C,
        0xA2, 0x6C, 0x8F, 0x77, 0x11, 0x8C, 0x6B, 0xF5};

    printf("\nTest: Matching with Python\n");

    inner_keccak256_prng_ctx ctx;
    uint8_t output_1[32];
    uint8_t output_2[32];

    inner_keccak256_init(&ctx);
    inner_keccak256_inject(&ctx, input, sizeof(input));
    inner_keccak256_flip(&ctx);
    inner_keccak256_extract(&ctx, output_1, 32);
    inner_keccak256_extract(&ctx, output_2, 32);

    printf("32-byte first output: ");
    print_hex(output_1, 32);
    printf("32-byte second output: ");
    print_hex(output_2, 32);

    assert(memcmp(output_1, out_1, 32) == 0);
    assert(memcmp(output_2, out_2, 32) == 0);
    printf("PASSED: Output matches with Python\n");
}

void test_python_2(void);

void test_python_2()
{
    // KeccakPRNG with input `061550234D158C5EC95595FE04EF7A25767F2E24CC2BC479D09D86DC9ABCFDE70404` outputs 128 bytes:
    uint8_t input[] = {0x06, 0x15, 0x50, 0x23, 0x4D, 0x15, 0x8C, 0x5E, 0xC9, 0x55, 0x95, 0xFE, 0x04, 0xEF, 0x7A, 0x25, 0x76, 0x7F, 0x2E, 0x24, 0xCC, 0x2B, 0xC4, 0x79, 0xD0, 0x9D, 0x86, 0xDC, 0x9A, 0xBC, 0xFD, 0xE7, 0x04, 0x04};
    uint8_t out[128] = {
        0x41, 0x5d, 0x0d, 0x5f, 0x0c, 0xb2, 0x3e, 0xcc, 0x62, 0x75, 0x0e, 0xf7, 0x73, 0x85, 0x40, 0x1c, 0x34, 0x48, 0xee, 0xa7, 0xb6, 0xa8, 0x71, 0xff, 0xcd, 0x8c, 0x37, 0x8c, 0x15, 0xac, 0xbb, 0x06, 0x20, 0xb5, 0xa9, 0x72, 0xb7, 0xfe, 0xc7, 0xfb, 0x4d, 0x31, 0x49, 0x28, 0x8d, 0xd7, 0xa9, 0xc8, 0xb3, 0x40, 0x36, 0xca, 0x9a, 0xde, 0x52, 0x71, 0x11, 0x67, 0xfe, 0x38, 0xb4, 0xd6, 0x5c, 0x9f, 0xe9, 0x7c, 0x97, 0xd5, 0xe2, 0xa5, 0xb2, 0x80, 0xa1, 0xcf, 0x91, 0x53, 0xe8, 0xcb, 0xa3, 0xf9, 0x75, 0x8a, 0x7c, 0xa8, 0xf0, 0x2f, 0x4e, 0x65, 0x25, 0x7b, 0x24, 0x55, 0x7e, 0x44, 0xa6, 0x71, 0xa6, 0x70, 0xed, 0x29, 0xcf, 0xcc, 0x79, 0x24, 0x4e, 0x64, 0x80, 0x77, 0x2c, 0x10, 0xa5, 0x5d, 0x13, 0xe7, 0x56, 0x35, 0x85, 0x12, 0xd9, 0x3d, 0x27, 0x2a, 0xf4, 0x5e, 0xda, 0x68, 0x50, 0x6c};

    printf("\nTest: Matching with Python\n");

    inner_keccak256_prng_ctx ctx;
    uint8_t output[128];

    inner_keccak256_init(&ctx);
    inner_keccak256_inject(&ctx, input, sizeof(input));
    inner_keccak256_flip(&ctx);
    inner_keccak256_extract(&ctx, output, 128);

    printf("32-byte first output: ");
    print_hex(output, 128);

    assert(memcmp(output, out, 128) == 0);
    printf("PASSED: Output matches with Python\n");
}

int main()
{
    printf("Running Unified PRNG Tests\n");
    printf("==========================\n\n");

    test_unified_basic_functionality();
    test_unified_different_lengths();
    test_unified_incremental_injection();
    test_unified_sequence();
    test_python();
    test_python_2();

    printf("\nAll unified PRNG tests passed successfully!\n");
    return 0;
}