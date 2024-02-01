// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract A {
    function aa() public view returns (uint) {
        return address(this).balance;
    }
}

contract A2 {
    /*
    (EOA -> CA)
    1. contract에 돈(msg.value) 보내야 되는데? (= methodID가 없고, msg.value가 있음)
    2. contract 입장에서 methodID를 못 받았으니 예외처리.
    3. receive() 라는 예외(methodID가 없고, msg.value 있는 상황)처리 해줘서 msg.value만큼 돈 받아야겠다.

    contract가 호출을 받았는데 제공 받을 method ID가 없을 때 예외처리로 receive()를 작성.
    -> receive, fallback 예외처리 찾아보기
    */
    // receive()는 항상 external, 돈 받으려고 쓰기 때문에 payable
    receive() external payable {}

    function aa() public view returns (uint) {
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
