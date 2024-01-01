// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 47. 배포와 함께 배포자가 owner로 설정되게 하세요. owner를 바꿀 수 있는 함수도 구현하되 그 함수는 owner만 실행할 수 있게 해주세요.
contract Q47 {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _addr) public {
        require(owner == msg.sender, "You are not owner now");
        owner = _addr;
    }

    function getOwner() public view returns(address) {
        return owner;
    }
    
}