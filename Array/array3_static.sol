// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
1. 값 넣기
2. 값 빼기
3. 값 보기
4. 값 바꾸기
*/

contract ARRAY_static {
    uint[6] numbers;

    function setNumber(uint _n, uint _m) public {
        numbers[_n - 1] = _m;
    }

    function deleteNumber(uint _n) public {
        delete numbers[_n - 1];
    }

    function getLength() public view returns(uint){
        return numbers.length;
    }

    function returnArray() public view returns(uint[6] memory) {
        return numbers;
    }
}