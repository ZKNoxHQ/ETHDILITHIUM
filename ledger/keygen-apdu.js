// dilithium-apdu.js
//
// a Javascript interface to sign a message with a Ledger device using Post-Quantum Dilithium
//
const TransportNodeHid = require("@ledgerhq/hw-transport-node-hid").default;

const fs = require('fs');

async function DilithiumKeygen() {
  console.time("Dilithium");
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

    // Build APDU list for signing
    const apdus = [];
    apdus.push({ name: "apdu_insecure_seed", command: "E014000015058000002c80001f91800000000000000000000000" });
    apdus.push({ name: "apdu_dilithium_keygen_core", command: "e00c000000" });

    // Execute all signing APDUs
    for (const { name, command } of apdus) {
      console.log(`\nSending APDU (${name}):`, command);

      const apduBuffer = Buffer.from(command, "hex");

      console.time("BenchAPDU")

      try {
        const response = await transport.exchange(apduBuffer);
        const responseHex = response.toString("hex");
        // console.log("Response received:", responseHex);

        const statusWord = response.slice(-2).toString("hex");
        const data = response.slice(0, -2).toString("hex");
        console.log("Data:", data);
        // console.log("Status Word:", statusWord);

        if (statusWord === "9000") {
          console.log("✅ APDU executed successfully");
        } else {
          console.log("❌ Error - Status Word:", statusWord);
        }
      } catch (err) {
        console.error(`❌ Error sending APDU (${name}):`, err.message);
      }
      console.timeEnd("BenchAPDU")
    }

    // Get public key
    const apdus2 = [];
    // Build APDU list for retrieving public key of 1312 bytes: 0xff * 5 + 0x25 
    apdus2.push({ name: "apdu_dilithium_get_pk_chunk_1", command: "e01300ff00" });
    apdus2.push({ name: "apdu_dilithium_get_pk_chunk_2", command: "e01301ff00" });
    apdus2.push({ name: "apdu_dilithium_get_pk_chunk_3", command: "e01302ff00" });
    apdus2.push({ name: "apdu_dilithium_get_pk_chunk_4", command: "e01303ff00" });
    apdus2.push({ name: "apdu_dilithium_get_pk_chunk_5", command: "e01304ff00" });
    apdus2.push({ name: "apdu_dilithium_get_pk_chunk_6", command: "e013052500" });

    let pubKeyHex = "";
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
        pubKeyHex += data;

        if (statusWord === "9000") {
          console.log("✅ APDU executed successfully");
        } else {
          console.log("❌ Error - Status Word:", statusWord);
        }
      } catch (err) {
        console.error(`❌ Error sending APDU (${name}):`, err.message);
      }
    }

    console.log("DILITHIUM PUBLIC KEY:", pubKeyHex);

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

DilithiumKeygen().catch(console.error);
