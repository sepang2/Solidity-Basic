// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 7. 숫자만 들어갈 수 있는 array numbers를 만들고 그 array안에 0부터 5까지 자동으로 채우는 함수와 array안의 모든 숫자를 더한 값을 반환하는 함수를 각각 구현하세요.(for 문)
contract Q7 {
    uint[] numbers;
    function pushNum() public {
        for(uint i = 0; i < 6; i++) {
            numbers.push(i);
        }
    }

    function sum() public view returns(uint) {
        uint _sum;

        for(uint i = 0; i < 6; i++) {
            _sum += numbers[i];
        }

        return _sum;
    }
}