// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 72. contract에 돈을 넣을 수 있는 deposit 함수를 구현하세요.
// 해당 contract의 돈을 인출하는 함수도 구현하되 오직 owner만 할 수 있게 구현하세요.
// owner는 배포와 동시에 배포자로 설정하십시오. 한번에 가장 많은 금액을 예치하면 owner는 바뀝니다.    
// 예) A (배포 직후 owner), B가 20 deposit(B가 owner), C가 10 deposit(B가 여전히 owner), D가 50 deposit(D가 owner), E가 20 deposit(D), E가 45 depoist(D), E가 65 deposit(E가 owner)
contract Q72 {
    address payable public owner;
    mapping(address => uint) public max;

    constructor() {
        owner = payable(msg.sender);
    }
    
    function deposit() public payable {
        max[msg.sender] = msg.value;

        if(max[msg.sender] > max[owner]) {
            owner = payable(msg.sender);
        }
    }

    function withdraw() public {
        require(msg.sender == owner, "Only Owner");
        owner.transfer(address(this).balance);
    }
}