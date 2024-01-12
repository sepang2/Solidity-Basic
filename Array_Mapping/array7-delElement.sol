// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
delNum과 delNum2의 반복문이 똑같다면(while, for)
delNum과 비교해서 delNum2의 가스비가 줄어들 것 같다.(지역변수에 복사해서 지역변수로 반복구문 돌리기 때문에)
하지만, delNum2가 가스비가 더 많이 든다.(변화하는 상태변수 개수가 더 많기 때문)
-> delNum은 상태변수의 _i번째부터 끝까지 값이 바뀐다.
-> delNum2는 지역변수로 바꿔놓은 '배열 전체 값'을 상태변수에 넣기 때문에 개수가 훨씬 더 많다.
*/
contract delete_element {
    uint[] public numbers;

    function setNum(uint[] calldata _arr) public {
        numbers = _arr;
    }

    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    function delNum(uint _i) public {
        while (_i != numbers.length) {
            numbers[_i - 1] = numbers[_i];
            _i++;
        }

        numbers.pop();
    }

    function delNum2(uint _idx) public {
        uint[] memory _numbers = new uint[](numbers.length);
        _numbers = numbers;

        for (uint i = _idx - 1; i < _numbers.length - 1; i++) {
            _numbers[i] = _numbers[i + 1];
        }

        numbers = _numbers;
        numbers.pop();
    }
}
