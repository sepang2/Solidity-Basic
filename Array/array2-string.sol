// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
1. 값 넣기
2. 값 빼기
3. 값 보기
4. 값 바꾸기
*/

contract ARRAY_S {
    string[] letters;

    // 1. 값 넣기
    function push(string memory _a) public {
        letters.push(_a); // array_이름.push(넣고 싶은 값)
    }

    // 2. 값 빼기
    function pop() public {
        letters.pop();
    }

    // 3. 값 보기
    function getLetter(uint _n) public view returns(string memory) {
        return letters[_n - 1];
    }

    // 4. 값 바꾸기
    function setLetter(uint _n, string memory _m) public {
        letters[_n - 1] = _m;
    }

    // 5. 값 비우기
    function deleteLetter(uint _n) public {
        delete letters[_n - 1];
    }

    function getLength() public view returns(uint) {
        return letters.length;
    }

    // 전체 반환
    function returnArray() public view returns(string[] memory) {
        return letters;
    }
}