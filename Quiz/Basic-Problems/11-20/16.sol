// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 16. 숫자들만 들어갈 수 있는 array를 선언하고 해당 array에 숫자를 넣는 함수도 구현하세요. 또 array안의 모든 숫자의 합을 더하는 함수를 구현하세요.
contract Q16 {
    uint[] arr;

    function pushNum(uint _a) public {
        arr.push(_a);
    }

    function sum() public view returns(uint) {
        uint _sum;

        for(uint i = 0; i < arr.length; i++) {
            _sum += arr[i];
        }

        return _sum;
    }
}