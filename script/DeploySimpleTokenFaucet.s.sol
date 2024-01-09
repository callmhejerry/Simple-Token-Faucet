// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Script} from "forge-std/Script.sol";
import {SimpleTokenFaucet} from "../src/SimpleTokenFaucet.sol";

contract DeploySimpleTokenFaucet is Script{
    function run()external returns (SimpleTokenFaucet){
        vm.startBroadcast();
        address tokenContractAddress = makeAddr("Faucet");
        SimpleTokenFaucet simpleTokenFaucet = new SimpleTokenFaucet(tokenContractAddress);
        vm.stopBroadcast();
        return simpleTokenFaucet;
    }
}