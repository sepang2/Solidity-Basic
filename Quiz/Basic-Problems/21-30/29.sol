// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 29. 숫자형 변수 a와 문자형 변수 b를 각각 10 그리고 “A”의 값으로 배포 직후 설정하는 contract를 구현하세요.
contract Q29 {
    uint a;
    string b;

    constructor() {
        a = 10;
        b = "A";
    }

    function getAB() public view returns(uint, string memory) {
        return (a, b);
    }
}