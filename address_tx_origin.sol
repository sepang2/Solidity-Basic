// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Origin {
    function A() public view returns(address) {
        return msg.sender;
    }

    function B() public view returns(address) {
        return tx.origin;
    }
}

contract Outsider {
    Origin public a = new Origin();

    // Outsider contract의 주소 반환
    function A() public view returns(address) {
        return a.A();
    }

    // 실행자의 지갑 주소 반환
    function B() public view returns(address) {
        return a.B();
    }
}