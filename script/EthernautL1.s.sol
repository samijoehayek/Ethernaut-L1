// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {EthernautL1} from "../src/EthernautL1.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract EthernautL1Script is Script {
    EthernautL1 public ethernautL1 =
        EthernautL1(0x5B0C08Bb63D0b3b5f114931b7d76FBb4E85bd94a);

    function run() public {
        string memory password = ethernautL1.password();
        console.log("Password: ", password);
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        ethernautL1.authenticate(password);
        vm.stopBroadcast();
    }
}
