// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

/*
Array : 배열
+ 같은 자료형들의 모임
+ 전체 값 반환(= return) 가능
+ 순서(= index) 있을 때 유리
- key, value 기능 못함

1. 값 넣기
2. 값 빼기
3. 값 보기
4. 값 바꾸기
5. 값 비우기(초기화) - 길이변화X
*/

contract ARRAY {
    uint[] numbers; // 자료형[] array_이름

    // 1. 값 넣기
    function push(uint _a) public {
       numbers.push(_a); // array_이름.push(넣고 싶은 값) 
    }

    // 2. 값 빼기
    function pop() public {
        numbers.pop();
    }

    // 3. 값 보기
    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n - 1];
    }

    // 4. 값 바꾸기
    function setNumber(uint _n, uint _m) public {
        numbers[_n - 1] = _m;
    }

    // 5. 값 비우기
    function deleteNumber(uint _n) public {
        delete numbers[_n - 1];
    }

    function getLength() public view returns(uint) {
        return numbers.length;
    }

    // 전체 반환
    function returnArray() public view returns(uint[] memory) {
        return numbers;
    }
}