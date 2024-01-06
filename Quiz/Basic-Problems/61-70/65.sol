// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 65. 숫자 3개를 입력하면 그 제곱을 반환하는 함수를 구현하세요. 그 3개 중에서 가운데 출력값만 반환하는 함수를 구현하세요.    
// 예) func A : input → 1,2,3 // output → 1,4,9 | func B : output 4 (1,4,9중 가운데 숫자) 
contract Q65 {
    function A(uint _x, uint _y, uint _z) public pure returns(uint[] memory) {
        uint[] memory _sqr = new uint[](3);
        
        _sqr[0] = _x**2;
        _sqr[1] = _y**2;
        _sqr[2] = _z**2;

        return _sqr;
    }

    function B(uint _x, uint _y, uint _z) public pure returns(uint) {
        uint[] memory _sqr = new uint[](3);

        _sqr = A(_x, _y, _z);
        
        return _sqr[1];
    }
}