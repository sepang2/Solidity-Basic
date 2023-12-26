// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 11. uint 형이 들어가는 array를 선언하고, 짝수만 들어갈 수 있게 걸러주는 함수를 구현하세요.
contract Q11 {
    uint[] even;

    function evenPush(uint _a) public {
        if(_a % 2 == 0) {
            even.push(_a);
        }
    }
}