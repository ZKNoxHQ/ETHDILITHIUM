// dilithium-apdu.js
//
// a Javascript interface to sign a message with a Ledger device using Post-Quantum Dilithium
//
const TransportNodeHid = require("@ledgerhq/hw-transport-node-hid").default;

const fs = require('fs');

async function DilithiumSign(message) {
  let transport;
  try {
    // List available devices
    const devices = await TransportNodeHid.list();
    console.log("Available devices:", devices);
    if (devices.length === 0) {
      console.log("No Ledger device found. Make sure it's connected and unlocked.");
      return;
    }

    // Connect to the first available device
    transport = await TransportNodeHid.open(devices[0]);
    console.log("Connected to Ledger Device");

    // Convert message to Buffer if it's a string
    const msgBuffer = Buffer.isBuffer(message) ? message : Buffer.from(message, 'hex');

    // Chunk the message into 255-byte pieces
    const chunks = [];
    for (let i = 0; i < msgBuffer.length; i += 255) {
      chunks.push(msgBuffer.slice(i, i + 255));
    }

    // Build APDU list for signing
    const apdus = [];

    // 1. Init command
    apdus.push({ name: "apdu_dilithium_sign_init", command: "e00f0000" });

    // 2. Absorb commands for each chunk
    chunks.forEach((chunk, index) => {
      const length = chunk.length.toString(16).padStart(2, '0');
      const chunkHex = chunk.toString('hex');
      const command = `e00f0100${length}${chunkHex}`;
      apdus.push({
        name: `apdu_dilithium_sign_absorb_${index + 1}`,
        command: command
      });
    });

    // 3. Core/finalize command
    apdus.push({ name: "apdu_dilithium_sign_core", command: "e00f8000020210" });

    // Execute all signing APDUs
    for (const { name, command } of apdus) {
      console.log(`\nSending APDU (${name}):`, command);

      const apduBuffer = Buffer.from(command, "hex");

      try {
        const response = await transport.exchange(apduBuffer);
        const responseHex = response.toString("hex");
        // console.log("Response received:", responseHex);

        const statusWord = response.slice(-2).toString("hex");
        const data = response.slice(0, -2).toString("hex");
        // console.log("Data:", data);
        // console.log("Status Word:", statusWord);

        if (statusWord !== "9000") {
          console.log("❌ Error - Status Word:", statusWord);
        }
      } catch (err) {
        console.error(`❌ Error sending APDU (${name}):`, err.message);
      }
    }

    // 4. Retrieve signature chunks from RAM
    console.log("\n========== RETRIEVING SIGNATURE ==========");

    // Build APDU list for retrieving signature of 2420 bytes: 0xff * 9 + 0x7d 
    const apdus2 = [];
    apdus2.push({ name: "apdu_dilithium_get_sig_chunk_1", command: "e01200ff00" });
    apdus2.push({ name: "apdu_dilithium_get_sig_chunk_2", command: "e01201ff00" });
    apdus2.push({ name: "apdu_dilithium_get_sig_chunk_3", command: "e01202ff00" });
    apdus2.push({ name: "apdu_dilithium_get_sig_chunk_4", command: "e01203ff00" });
    apdus2.push({ name: "apdu_dilithium_get_sig_chunk_5", command: "e01204ff00" });
    apdus2.push({ name: "apdu_dilithium_get_sig_chunk_6", command: "e01205ff00" });
    apdus2.push({ name: "apdu_dilithium_get_sig_chunk_7", command: "e01206ff00" });
    apdus2.push({ name: "apdu_dilithium_get_sig_chunk_8", command: "e01207ff00" });
    apdus2.push({ name: "apdu_dilithium_get_sig_chunk_9", command: "e01208ff00" });
    apdus2.push({ name: "apdu_dilithium_get_sig_chunk_10", command: "e012097d00" });

    let sigHex = "";

    // Execute all signing APDUs
    for (const { name, command } of apdus2) {
      console.log(`\nSending APDU (${name}):`, command);

      const apduBuffer = Buffer.from(command, "hex");

      try {
        const response = await transport.exchange(apduBuffer);
        const responseHex = response.toString("hex");
        // console.log("Response received:", responseHex);

        const statusWord = response.slice(-2).toString("hex");
        const data = response.slice(0, -2).toString("hex");
        // console.log("Data:", data);
        // console.log("Status Word:", statusWord);
        sigHex += data;

        if (statusWord !== "9000") {
          console.log("❌ Error - Status Word:", statusWord);
        }
      } catch (err) {
        console.error(`❌ Error sending APDU (${name}):`, err.message);
      }
    }

    fs.writeFile('sig', sigHex, (err) => {
      if (err) throw err;
      console.log('Signature file saved!');
    });

    // get app name
    const apdus30 = [];
    apdus30.push({ name: "apdu_get_name", command: "e0040000" });
    let appname = "";
    for (const { name, command } of apdus30) {
      console.log(`\nSending APDU (${name}):`, command);

      const apduBuffer = Buffer.from(command, "hex");

      try {
        const response = await transport.exchange(apduBuffer);
        const statusWord = response.slice(-2).toString("hex");

        // The app should return: [nameLength][nameBytes][versionLength][versionBytes]
        let offset = 0;
        const nameLength = response[offset];
        const name = response.slice(0, -2).toString("utf-8");
        appname += name;

        if (statusWord !== "9000") {
          console.log("❌ Error - Status Word:", statusWord);
        }
      } catch (err) {
        console.error(`❌ Error sending APDU (${name}):`, err.message);
      }
    }

    // 5. Retrieve public key chunks from RAM
    console.log("\n========== RETRIEVING PUBLIC KEY ==========");

    // Build APDU list for retrieving public key of 1312 bytes: 0xff * 5 + 0x25 
    const apdus3 = [];
    apdus3.push({ name: "apdu_dilithium_get_pk_chunk_1", command: "e01300ff00" });
    apdus3.push({ name: "apdu_dilithium_get_pk_chunk_2", command: "e01301ff00" });
    apdus3.push({ name: "apdu_dilithium_get_pk_chunk_3", command: "e01302ff00" });
    apdus3.push({ name: "apdu_dilithium_get_pk_chunk_4", command: "e01303ff00" });
    apdus3.push({ name: "apdu_dilithium_get_pk_chunk_5", command: "e01304ff00" });
    apdus3.push({ name: "apdu_dilithium_get_pk_chunk_6", command: "e013052500" });

    let pubKeyHex = "";

    // Execute all signing APDUs
    for (const { name, command } of apdus3) {
      console.log(`\nSending APDU (${name}):`, command);

      const apduBuffer = Buffer.from(command, "hex");

      try {
        const response = await transport.exchange(apduBuffer);
        const responseHex = response.toString("hex");
        // console.log("Response received:", responseHex);

        const statusWord = response.slice(-2).toString("hex");
        const data = response.slice(0, -2).toString("hex");
        // console.log("Data:", data);
        // console.log("Status Word:", statusWord);
        pubKeyHex += data;

        if (statusWord !== "9000") {
          console.log("❌ Error - Status Word:", statusWord);
        }
      } catch (err) {
        console.error(`❌ Error sending APDU (${name}):`, err.message);
      }
    }

    fs.writeFile('public_key.pem', "# public key\npk = " + pubKeyHex + "\nversion = " + appname, (err) => {
      if (err) throw err;
      console.log('Public key file saved!');
    });

  } catch (error) {
    console.error("Error with Ledger transport:", error.message);
    if (error.message.includes("cannot open device")) {
      console.log("Make sure the Ledger is unlocked and not being used by another application");
    } else if (error.message.includes("No device found")) {
      console.log("Make sure the Ledger is connected via USB");
    }
  } finally {
    if (transport) {
      await transport.close();
      console.log("\nConnection closed");
    }
  }
}

// Example usage with your original message
const message = process.argv[2];
// const message = "9B64813C058F07A09A796FD764604EAF58CE144363702896DF0AB5FF26D5DE000D14BB8FD358FF5532D3B909AB62C18AC30F1900F84EBD3F4F18BD532D16C7B3470F0F8BDF72938C916DB18BCF1429DC1635B1C152C5F89A9EDB17116C11815A6C06273A889132923DA908FF39F4940A840D3CB575DC4D637AAFD37968EC61FC4EA04B4C320491A73ECFBDD8E10F1DFE902FCCEF93DD287ED872F67146BB8CA5A6ADCF0350E8BBA7F2F9762C4AA748FCE19748EB17334146C152FD63FAE3DFBB1A2C2B3C78960369551FDAC5D54643BEEAA59C1FEB0C21DBBB19977D848CD82A7AE0005F45956E0FE4700F14FBAA0C12FB8C65A6AEC95C5A5C8E79A6DA9C4E446872575C06AE49A31B82245E1757C7CE84D6D5DF3F642D3434B7E1A15A8B8A9DB460826B6CDCA69022DBF87595B582DDBB90A81E09A13C2AB1C125E4435FF30ABC9C56A00EDFA979F79D9C895E800D2DD6372FAE5FAACD83ADF8A6D55279D52DF547E9BAB39D99076AD7D297371344D35BD584E0FB5932F92FD5183B9250CD180FC645BEF6028C405B0EF35DAF783428173F1F2482AA1363640F66AF0FE8ECACC0DAB84ABD2A1FB53AF44445698CF1DDF4C2EA214DD339BE004E75BF76E95CA5C16981ABA5540689C1C1F1DAF4D0F89D62CCB3496340D61E7D5F5156FD3EDD02EDFEC8FCDD0B231697B0E66F4A3AAF46117532F5EE2CB4D2B3B82B0BEAE0A45A482CE9A976CC99AA82BEB0FE08CB68C4";
DilithiumSign(message).catch(console.error);
