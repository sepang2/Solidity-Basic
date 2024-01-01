// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 35. 숫자만 들어갈 수 있는 array를 선언하고 해당 array의 짝수번째 요소만 모아서 반환하는 함수를 구현하세요.
// 예) [1,2,3,4,5,6] -> [2,4,6] // [3,5,7,9,11,13] -> [5,9,13]

// 이렇게 함수 3개로 구현하는게 맞나? 만약 함수 하나로 만든다면 어떻게?
contract Q35 {
    uint[] arr;
    uint[] even;

    function pushNum(uint[] memory _n) public {
        arr = _n;
    }

    function setEven() public {
        for(uint i = 1; i < arr.length; i+=2) {
            even.push(arr[i]);
        }
    }

    function getEven() public view returns(uint[] memory) {
        return even;
    }
}