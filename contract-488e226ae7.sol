// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.9.1/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.1/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.9.1/security/Pausable.sol";
import "@openzeppelin/contracts@4.9.1/access/Ownable.sol";
import "@openzeppelin/contracts@4.9.1/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts@4.9.1/token/ERC20/extensions/ERC20FlashMint.sol";

contract Netwrck is ERC20, ERC20Burnable, Pausable, Ownable, ERC20Permit, ERC20FlashMint {
    constructor() ERC20("Netwrck", "NETW") ERC20Permit("Netwrck") {
        _mint(msg.sender, 10000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
