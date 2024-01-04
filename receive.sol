// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract A {
    function aa() public view returns(uint) {
        return address(this).balance;
    }
}

contract A2 {
    /*
    1. contract에 돈 보내야 되는데?
    2. 예외처리로 receive() 처리 해줘서 msg.value만큼 돈 받아야겠다.

    contract 호출을 받았는데 내가 제공할 method ID가 없을 때 예외처리로 receive()를 작성.
    -> receive, fallback 예외처리 찾아보기
    */
    // receive()는 항상 external, 돈 받으려고 쓰기 때문에 payable
    receive() external payable {}
    
    function aa() public view returns(uint) {
        return address(this).balance;
    }
}

contract B {
    function deposit() public payable {}

    function transfer(address _destin, uint _n) public {
        payable(_destin).transfer(_n);
    }
}

// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// 100000000000000000