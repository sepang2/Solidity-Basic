// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 동적 이중 배열
contract dynamic_mulitArray {
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
contract static_multiArray {
    uint[4][6] public numbers;

    function getLength() public view returns(uint) {
        return numbers.length;
    }

    function pushNumbers(uint[4] memory _a) public {
        numbers[0] = _a;
    }
}

// 일반적인 다중배열 크기 표현이랑 반대로 표현함.
contract multiArray {
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

contract multiArray2 {
    uint[][] public a;
    uint[4][6] public b;
    uint[4][] public c;
    uint[][6] public d;

    function getLengths() public view returns(uint, uint, uint, uint) {
        return (a.length, b.length, c.length, d.length);
    }

    function pushB(uint _n, uint[4] memory _a) public {
        b[_n - 1] = _a;
    }

    function pushC(uint[4] memory _a) public {
        c.push(_a);
    }

    function pushD(uint _n, uint[] memory _a) public {
        d[_n - 1] = _a;
    }

    function getB(uint _n) public view returns(uint[4] memory){
        return b[_n - 1];
    }

    function getC(uint _n) public view returns(uint[4] memory) {
        return c[_n - 1];
    }

    function getD(uint _n) public view returns(uint[] memory) {
        return d[_n - 1];
    }
}

// gas 비교 (transaction cost)
// 가장 정적 < 가장 동적
contract gasFee {
    // a > b
    uint[] a;
    uint[3] b;

    // a_ > b_ > _a > _b
    uint[][] a_;
    uint[3][] _a;
    uint[][3] b_;
    uint[3][3] _b;

    function setA(uint A) public {
        a.push(A); // 65968, 48868, 48868
    }

    function setB(uint _n, uint A) public {
        b[_n] = (A); // 44113, 44125, 44125
    }

    function setA2(uint[3] memory A) public {
        a_.push(A); // 134024, 116924, 116924
    }

    function setA3(uint[3] memory B) public {
        _a.push(B); // 111921, 94821, 94821
    }

    function setB2(uint _n, uint[3] memory A) public {
        b_[_n] = A; // 112137, 112149, 112149
    }

    function setB3(uint _n, uint[3] memory A) public {
        _b[_n] = A; // 90009, 90021, 90021
    }
}