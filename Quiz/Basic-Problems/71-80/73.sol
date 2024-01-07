// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 73. 위의 문제의 다른 버전입니다. 누적으로 가장 많이 예치하면 owner가 바뀌게 구현하세요.    
// 예) A (배포 직후 owner), B가 20 deposit(B가 owner), C가 10 deposit(B가 여전히 owner), D가 50 deposit(D가 owner), E가 20 deposit(D), E가 45 depoist(E가 owner, E 누적 65), E가 65 deposit(E)
contract Q73 {
    address payable public owner;
    mapping(address => uint) public bal;

    constructor() {
        owner = payable(msg.sender);
    }
    
    function deposit() public payable {
        bal[msg.sender] += msg.value;

        if(bal[msg.sender] > bal[owner]) {
            owner = payable(msg.sender);
        }
    }

    function withdraw() public {
        require(msg.sender == owner, "Only Owner");
        owner.transfer(address(this).balance);
    }
}