// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 21. 3의 배수만 들어갈 수 있는 array를 구현하세요.
contract Q21 {
    uint[] arr;

    function setArr(uint _n) public {
        require(_n % 3 == 0);
        arr.push(_n);
    }
}
