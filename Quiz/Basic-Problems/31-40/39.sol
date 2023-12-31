// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 39. 특정 숫자의 자릿수까지의 2의 배수, 3의 배수, 5의 배수 7의 배수의 개수를 반환해주는 함수를 구현하세요.
// 예) 15 : 7,5,3,2  (2의 배수 7개, 3의 배수 5개, 5의 배수 3개, 7의 배수 2개) // 100 : 50,33,20,14  (2의 배수 50개, 3의 배수 33개, 5의 배수 20개, 7의 배수 14개)
contract Q39 {
    function multiples(uint _n) public pure returns(uint[4] memory) {
        uint[4] memory _arr;

        _arr[0] = _n / 2;
        _arr[1] = _n / 3;
        _arr[2] = _n / 5;
        _arr[3] = _n / 7;

        return _arr;
    }
}