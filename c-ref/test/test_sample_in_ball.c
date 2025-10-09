// THIS FILE IS TAKEN FROM https://github.com/zhenfeizhang/falcon-go/blob/main/c/keccak256.c
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include "../poly.h"

void test_sample_in_ball_nist(void);

void test_sample_in_ball_nist()
{
    printf("Test: Sample in ball NIST\n");

    // c_tilde as raw bytes from ETHDILITHIUM repository
    uint8_t c_tilde[] = {
        0xcc, 0x50, 0x1e, 0x9f, 0x47, 0x1a, 0x00, 0x4d,
        0x2d, 0x3f, 0x60, 0x89, 0x4d, 0x12, 0xaa, 0xd3,
        0x11, 0x4e, 0x8a, 0xbf, 0x62, 0xe4, 0x13, 0xa8,
        0x00, 0xb7, 0xe7, 0x98, 0x7e, 0xc5, 0x10, 0x0b};

    // expected_c as array of 256 unsigned 32-bit integers
    int32_t expected_c[256] = {
        0, 8380416, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 8380416, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 8380416, 0, 1, 0, 0, 0, 8380416, 8380416, 0, 0, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8380416, 8380416, 0, 0, 0, 0, 1, 1, 0, 0, 0, 8380416, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 1, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 8380416, 0, 0, 0, 0, 0, 8380416, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8380416, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    poly c;
    poly_challenge(&c, c_tilde);
    for (int i = 0; i < 256; i++)
    {
        if (c.coeffs[i] == 0)
        {
            assert(expected_c[i] == 0);
        }
        else
        {
            assert(c.coeffs[i] == (expected_c[i] == 8380416 ? -1 : 1));
        }
    }

    printf("PASSED: Sample In Ball NIST version\n");
}

void test_sample_in_ball_eth(void);

void test_sample_in_ball_eth()
{
    printf("Test: Sample in ball ETH\n");

    // c_tilde as raw bytes from ETHDILITHIUM repository
    uint8_t c_tilde[] = {
        0xcc, 0x50, 0x1e, 0x9f, 0x47, 0x1a, 0x00, 0x4d,
        0x2d, 0x3f, 0x60, 0x89, 0x4d, 0x12, 0xaa, 0xd3,
        0x11, 0x4e, 0x8a, 0xbf, 0x62, 0xe4, 0x13, 0xa8,
        0x00, 0xb7, 0xe7, 0x98, 0x7e, 0xc5, 0x10, 0x0b};

    // expected_c as array of 256 unsigned 32-bit integers
    int32_t expected_c[256] = {
        0, 0, 0, 0, 0, 0, 1, 0, 0, 8380416, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8380416, 0, 8380416, 0, 8380416, 8380416, 0, 0, 0, 0, 8380416, 8380416, 8380416, 0, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 0, 1, 0, 8380416, 8380416, 0, 0, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 8380416, 0, 0, 0, 8380416, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 8380416, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8380416, 0, 0, 8380416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0};

    poly c;
    poly_challenge_eth(&c, c_tilde);
    for (int i = 0; i < 256; i++)
    {
        if (c.coeffs[i] == 0)
        {
            assert(expected_c[i] == 0);
        }
        else
        {
            assert(c.coeffs[i] == (expected_c[i] == 8380416 ? -1 : 1));
        }
    }

    printf("PASSED: Sample In Ball ETH version\n");
}

int main()
{
    printf("Running Sample In Ball Tests\n");
    printf("==========================\n\n");

    test_sample_in_ball_nist();
    test_sample_in_ball_eth();

    printf("\nAll Sample In Ball tests passed successfully!\n");
    return 0;
}