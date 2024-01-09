// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 동적 이중 배열
contract A {
    uint[][] public double_a;

    function pushNum1(uint _a) public {
        double_a.push([_a]);
    }

    function pushNum2_1(uint _a, uint _b) public {
        double_a.push([_a, _b]);
    }

    function pushNum2_2(uint[] memory _a) public {
        double_a.push(_a);
    } 

    function getLine(uint _a) public view returns(uint[] memory) {
        return double_a[_a];
    }
    
    function setNum(uint _a, uint _b, uint _c) public {
        double_a[_a][_b] = _c;
    }

    function getLength1() public view returns(uint) {
        return double_a.length;
    }

    function getLength2(uint _a) public view returns(uint) {
        return double_a[_a].length;
    }
}

// 정적 이중 배열
contract B {
    uint[4][6] public numbers;

    function getLength() public view returns(uint) {
        return numbers.length;
    }

    function pushNumbers(uint[4] memory _a) public {
        numbers[0] = _a;
    }
}

// 일반적인 다중배열 크기 표현이랑 반대로 표현함.
contract C {
    uint[4][] public num1; // 길이 4개짜리가 무한정 들어올 수 있다. (동적)
    uint[][4] public num2; // 길이 무한정짜리가 4개까지 들어올 수 있다. (정적)

    // num1은 동적이기 때문에 길이 0 반환
    function getLength1() public view returns(uint) {
        return num1.length;
    }

    // num2는 정적이기 때문에 길이 4 반환
    function getLength2() public view returns(uint) {
        return num2.length;
    }

    // num1은 동적 -> push() 가능
    function push1(uint[4] memory _a) public {
        num1.push(_a);
    }

    // num2는 정적 -> push() 불가
    function push2(uint _n, uint[] memory _a) public {
        num2[_n] = _a;
    }
}