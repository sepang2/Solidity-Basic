// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 50. 숫자 3개가 부여되면 그 3개의 숫자를 이어붙여서 반환하는 함수를 구현하세요. 
// 예) 3,1,6 → 316 // 1,9,3 → 193 // 0,1,5 → 15 
contract Q50_1 {
    function getNum(uint _x, uint _y, uint _z) public pure returns(uint) {
        uint _num;
        _num = _x * 100 + _y * 10 + _z;
        
        return _num;
    }
}

// 응용 문제 : 3개 아닌 n개의 숫자 이어붙이기
contract Q50_2 {
    uint[] arr;

    function pushNum(uint _n) public {
        arr.push(_n);
    }

    function getNum() public view returns(uint) {
        uint _num;

        for(uint i = 0; i < arr.length; i++) {
           _num += arr[arr.length - 1 - i] * 10**i; 
        }

        return _num;
    }
}