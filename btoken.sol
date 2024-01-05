// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BToken is ERC20("LikeLion", "LION") {
    function MintToken(uint a) public {
        _mint(address(this), a);
    }

    function distribute(uint a) public {
        _mint(msg.sender, a);
    }

    function decimals() public pure override returns(uint8) {
        return 0;
    }

    receive() external payable {}
}