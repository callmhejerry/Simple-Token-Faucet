// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {IERC20} from "forge-std/interfaces/IERC20.sol";

error TokenExceeded(uint256 amount, address requester);
error FailedToSend();

contract SimpleTokenFaucet {
    IERC20 public token;

    event SentToken(address indexed to);

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function requestToken(uint256 _amount) external {
        require(msg.sender != address(0));
        if (_amount > 20) {
            revert TokenExceeded(_amount, msg.sender);
        }
        bool success = token.transfer(msg.sender, _amount);
        if (success){
            emit SentToken(msg.sender);
        }else {
            revert FailedToSend();
        }
    }
}
