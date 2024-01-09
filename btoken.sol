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

contract BToken2 is ERC20("LikeLion2", "LION2") {
    function MintToken(uint a) public {
        _mint(address(this), a);
    }

    function distribute(uint a) public {
        _mint(msg.sender, a);
    }

    function decimals() public pure override returns(uint8) {
        return 3;
    }

    receive() external payable {}
}

contract BToken3 is ERC20("LikeLion3", "LION3") {
    function MintToken(uint a) public {
        _mint(address(this), a);
    }

    function distribute(uint a) public {
        _mint(msg.sender, a);
    }

    function decimals() public pure override  returns(uint8) {
        return 0;
    }

    function balanceOf() public pure returns(uint) {
        return 1000;
    }

    receive() external payable{}
}

contract BToken3_2 is ERC20("LikeLion3", "LION3") {
    function MintToken(uint a) public {
        _mint(address(this), a);
    }

    function distribute(uint a) public {
        _mint(msg.sender, a);
    }

    function decimals() public pure override  returns(uint8) {
        return 0;
    }

    function balanceOf(address _addr) public override pure returns(uint) {
        return 1000;
    }

    receive() external payable{}
}

contract BToken4 is ERC20("LikeLion4", "LION4") {
    function MintToken(uint a) public {
        _mint(address(this), a);
    }

    function distribute(uint a) public payable {
        require(msg.value == a * 10**16);
        _mint(msg.sender, a);
    }

    function decimals() public pure override  returns(uint8) {
        return 0;
    }

    receive() external payable{}
}