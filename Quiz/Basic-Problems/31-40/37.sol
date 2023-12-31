// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 37. 1 wei를 기부하는 기능, 1 finney를 기부하는 기능 그리고 1 ether를 기부하는 기능을 구현하세요.
// 최초의 배포자만이 해당 smart contract에서 자금을 회수할 수 있고 다른 이들은 못하게 막는 함수도 구현하세요.
// (힌트 : 기부는 EOA가 해당 Smart Contract에게 돈을 보내는 행위, contract가 돈을 받는 상황)
contract Q37 {
    address payable owner;
    
    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw_all() public {
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }

    function donateWei() public payable {
        require(msg.value == 1 wei);
    }

    // finney가 안써져서 ether로. 1 eth = 1000 finney
    function donateFinney() public payable {
        require(msg.value == 0.001 ether);
    }

    function donateEther() public payable {
        require(msg.value == 1 ether);
    }
}