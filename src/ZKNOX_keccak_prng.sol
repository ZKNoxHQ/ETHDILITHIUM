// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/**
 * Keccak256-Based PRNG
 * A cryptographically secure PRNG based on Keccak-256
 */
contract ZKNOX_keccak_prng {
    // State Variables
    bytes32 private state;
    uint64 private counter;
    bytes private buffer;
    bool private finalized;

    // Output buffer
    bytes32 private outBuffer;
    uint8 private outBufferPos;
    bool private outBufferValid;

    /**
     * Initializes the PRNG state
     */
    constructor() {
        state = bytes32(0);
        counter = 0;
        buffer = "";
        finalized = false;
        outBufferPos = 0;
        outBufferValid = false;
    }

    /**
     * Injects `input` into the PRNG state
     */
    function inject(bytes memory input) public {
        require(!finalized, "Cannot inject after finalization");

        // Accumulate input into the buffer
        buffer = abi.encodePacked(buffer, input);   
    }

    /**
     * Finalizes the state for output generation
     */
    function flip() public {
        require(!finalized, "Already finalized");

        // Initialize state with the Keccak-256 of the buffer
        state = keccak256(buffer);
        finalized = true;

        // Reset output buffer
        outBufferPos = 0;
        outBufferValid = false;
    }

    /**
     * Generates pseudorandom output
     * length is the number of bytes to generate
     */
    function extract(uint256 length) public returns (bytes memory randomBytes) {
        require(finalized, "PRNG not finalized");

        bytes32 state_tmp = state;
        randomBytes = new bytes(length);
        uint256 offset = 0;

        // Use any remaining bytes in the output buffer first
        while (outBufferValid && outBufferPos < 32 && offset < length) {
            randomBytes[offset] = outBuffer[outBufferPos];
            outBufferPos++;
            offset++;
        }

        bytes memory blockInput;

        // Generate additional blocks as needed
        while (offset < length) {
            // Prepare input block: state || counter (big-endian)
            blockInput = abi.encodePacked(state_tmp, uint64ToBytes(counter));

            // Generate the next output block using Keccak-256
            outBuffer = keccak256(blockInput);
            outBufferPos = 0;
            outBufferValid = true;

            // Copy to output
            while (outBufferPos < 32 && offset < length) {
                randomBytes[offset] = outBuffer[outBufferPos];
                outBufferPos++;
                offset++;
            }

            // Increment the counter
            counter++;
        }
    }

    /**
     * convert uint64 to big-endian bytes
     */
    function uint64ToBytes(uint64 x) internal pure returns (bytes memory b) {
        b = new bytes(8);
        for (uint256 i = 0; i < 8; i++) {
            b[i] = bytes1(uint8(x >> (56 - i * 8)));
        }
    }
}
