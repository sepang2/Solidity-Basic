// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 52. 자동으로 아이디를 만들어주는 함수를 구현하세요.
// 이름, 생일, 지갑주소를 기반으로 만든 해시값의 첫 10바이트를 추출하여 아이디로 만드시오.
/*
msg.sender는 지역변수 취급 못함 => pure 못씀
*/
contract Q52 {
   function  setID(string memory _name, uint birthday) public pure returns(bytes10) {
        return;
   }
}