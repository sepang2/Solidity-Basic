// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 301287, 230873
contract MODIFIER1 {
    uint a;
    
    modifier higherThanFive() {
        require(a >= 5, "go back");
        _; // modifier 걸려있는 함수가 실행되는 위치
    }

    function setA(uint _n) public {
        a = _n;
    }

    function A() public view higherThanFive returns(uint) {
        // require(a >= 5, "go back");
        return a * 5;
    }

    function B() public view higherThanFive returns(uint) {
        // require(a >= 5, "go back");
        return a**2;
    }
}

// 301287, 230873
contract MODIFIER1_2 {
    uint a;
    
    function setA(uint _n) public {
        a = _n;
    }

    function A() public view returns(uint) {
        require(a >= 5, "go back");
        return a * 5;
    }

    function B() public view returns(uint) {
        require(a >= 5, "go back");
        return a**2;
    }
}

// 286697, 217055
contract MODIFIER1_3 {
    uint a;
    
    modifier higherThanFive() {
        require(a >= 5, "go back");
        _; // modifier 걸려있는 함수가 실행되는 위치
    }

    function setA(uint _n) public {
        a = _n;
    }

    function A() public view higherThanFive returns(uint) {
        return a * 5;
    }

    function B() public view returns(uint) {
        return a**2;
    }
}

contract MODIFIER2 {
    uint a;
    uint b;

    modifier mul1() {
        a *= 2;
        _;
    }

    modifier mul2() {
        _;
        b *= 2;
    }

    function getAB() public view returns(uint, uint) {
        return (a, b);
    }

    function A() public mul1 {
        a += 7;
    }

    function B() public mul2 {
        b += 7;
    }
}

contract MODIFIER2_2 {
    uint a = 1;
    uint b = 1;

    modifier mul1() {
        a *= 2;
        _;
        a *= 2;
    }

    modifier mul2() {
        _;
        b *= 2;
        _;
    }

    function getAB() public view returns(uint, uint) {
        return (a, b);
    }

    function A() public mul1 {
        a += 7;
    }

    function B() public mul2 {
        b += 7;
    }
}

contract MODIFIER3 {
    uint a = 1;

    uint b;
    uint c;

    modifier mul1() {
        a *= 3;
        _;
    }

    modifier mul2() {
        a += 7;
        _;
    }

    function resetA() public {
        a = 1;
    }

    function setB() public mul1 mul2 {
        b = a;
    }

    function setC() public mul2 mul1 {
        c = a;
    }

    function getBC() public view returns(uint, uint) {
        return (b, c);
    }
}

contract MODIFIER4 {
    uint a;

    modifier plusoneBefore() {
        a++;
        _;
    }

    modifier plusoneAfter() {
        _;
        a++;
    }

    function setA(uint _n) public {
        a = _n;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function setA1() public plusoneBefore returns(bool) {
        if(a >= 3) {
            return true;
        } else {
            return false;
        }
    }

    function setA2() public plusoneAfter returns(bool) {
        if(a >= 3) {
            return true;
        } else {
            return false;
        }
    }
}