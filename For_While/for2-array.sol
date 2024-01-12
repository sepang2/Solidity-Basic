// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// array 모든 요소 2씩 더해보기
contract FOR {
    uint[] numbers;

    function push(uint a) public {
        numbers.push(a);
    }

    function getArray() public view returns(uint[] memory) {
        return numbers;
    }

    function addTwoAll() public {
        for(uint i = 0; i < numbers.length; i++){
            numbers[i] += 2;
        }
    }

    function addTwoAll2(uint[] memory _numbers) public pure returns(uint[] memory) {
        for(uint i = 0; i < _numbers.length; i++) {
            _numbers[i] += 2;
        }

        return _numbers;
    }

    function addTwoAll3() public view returns(uint[] memory) {
        uint[] memory a = numbers;

        for(uint i = 0; i < numbers.length; i++) {
            a[i] += 2;
        }

        return a;
    }
}