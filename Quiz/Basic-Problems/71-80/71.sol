// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 71. 숫자형 변수 a를 선언하고 a를 바꿀 수 있는 함수를 구현하세요.
// 한번 바꾸면 그로부터 10분동안은 못 바꾸게 하는 함수도 같이 구현하세요.
contract Q71 {
    uint public a;
    uint time;

    function setA(uint _a) public {
        require(block.timestamp > time + 10 minutes, "You can change only once every 10mins.");

        time = block.timestamp;
        a = _a;
    }
}