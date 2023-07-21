// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract DistributeEther is ReentrancyGuard, AccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    // Define your events
    event TransferFailed(address recipient);
    event EtherDistributed(address sender, uint256 totalAmount);
    event EtherSent(address sender, address recipient, uint256 amount);

    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _setupRole(ADMIN_ROLE, _msgSender());
    }

    receive() external payable {}

    function distributeEther(address payable[] memory recipients, uint256 amountInHundredthEther) public payable nonReentrant onlyRole(ADMIN_ROLE) {
        uint256 amountInWei = amountInHundredthEther * 0.01 ether;

        require(address(this).balance >= amountInWei * recipients.length, "Insufficient balance in the contract");

        for (uint256 i = 0; i < recipients.length; i++) {
            // Use call instead of transfer to handle potential failure
            (bool success, ) = recipients[i].call{value: amountInWei}("");
            if (!success) {
                // Fire event when transfer fails
                emit TransferFailed(recipients[i]);
            }
        }
        // Fire event after all Ether is successfully distributed
        emit EtherDistributed(msg.sender, amountInWei * recipients.length);
    }

    function sendEther(address payable recipient, uint256 amountInHundredthEther) public payable nonReentrant onlyRole(ADMIN_ROLE) {
        uint256 amountInWei = amountInHundredthEther * 0.01 ether;

        require(address(this).balance >= amountInWei, "Insufficient balance in the contract");

        (bool success, ) = recipient.call{value: amountInWei}("");
        if (!success) {
            emit TransferFailed(recipient);
        } else {
            // Fire event when Ether is successfully sent
            emit EtherSent(msg.sender, recipient, amountInWei);
        }
    }
}