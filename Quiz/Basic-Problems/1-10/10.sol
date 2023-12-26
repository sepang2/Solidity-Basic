// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 10. 숫자만 들어가는 array numbers를 선언하고 숫자를 넣고(push), 빼고(pop), 특정 n번째 요소의 값을 볼 수 있는(get)함수를 구현하세요.
contract Q10 {
    uint[] numbers;

    function push(uint _a) public {
        numbers.push(_a);
    }

    function pop() public {
        numbers.pop();
    }

    function get(uint _a) public view returns(uint) {
        return numbers[_a - 1];
    }
}