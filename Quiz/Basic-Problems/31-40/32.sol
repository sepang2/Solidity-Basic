// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 32. 3의 배수만 들어갈 수 있는 array를 구현하되, 3의 배수이자 동시에 10의 배수이면 들어갈 수 없는 추가 조건도 구현하세요.
// 예) 3 → o , 9 → o , 15 → o , 30 → x
contract Q32 {
    uint[] arr;

    function pushNum(uint _n) public {
        require(_n % 3 == 0 && _n % 10 != 0);
        arr.push(_n);
    }
}