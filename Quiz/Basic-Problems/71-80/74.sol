// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 74. 어느 숫자를 넣으면 항상 10%를 추가로 더한 값을 반환하는 함수를 구현하세요.    
// 예) 20 -> 22(20 + 2, 2는 20의 10%), 0 // 50 -> 55(50+5, 5는 50의 10%), 0
// 42 -> 46(42+4), 2 (42의 10%는 4.2 -> 46.2, 46과 2를 분리해서 반환)
// 27 => 29(27+2), 7 (27의 10%는 2.7 -> 29.7, 29와 7을 분리해서 반환)
contract Q74 {
    function get110percent(uint _n) public pure returns(uint, uint) {
        return (_n + _n / 10, _n % 10);
    }
}