// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

error TokenExceeded(uint amount, address requester);
error FailedToSend();

contract SimpleTokenFaucet {
    IERC20 public token ;
    constructor (address _tokenAddress){
        token = IERC20(_tokenAddress);
    }

    function requestToken(uint _amount)external{
        if (_amount > 20){
            revert TokenExceeded(_amount, msg.sender);
        }
        (bool success,) =   msg.sender.call{"value": _amount}("");
        if (!success){
            revert FailedToSend();
            }
    }
}