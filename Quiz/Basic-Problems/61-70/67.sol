// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 67. 자신의 현재 잔고를 반환하는 함수를 보유한 Contract A와 다른 주소로 돈을 보낼 수 있는 Contract B를 구현하세요.
contract Q67_A {
    function getMyBalance() public view returns(uint) {
        return msg.sender.balance;
    }
}

contract Q67_B {
    function deposit() public payable {}

    function send(address payable _addr, uint _eth) public {
        _addr.transfer(_eth * 1 ether);
    }
}