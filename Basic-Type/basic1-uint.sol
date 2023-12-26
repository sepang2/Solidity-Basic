// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

// 숫자형 선언
contract Basic{
    uint a; // 숫자형 변수 a
    uint b; // 숫자형 변수 b
    uint c = 2; // 숫자형 변수 c

    function setA(uint _a) public {
        a = _a;
    }

    function setB(uint _b) public {
        b = _b;
    }

    function setC(uint _c) public {
        c = _c;
    }

    function setAB(uint _a, uint _b) public {
        a = _a;
        b = _b;
    }

    function setAasFive() public {
        a = 5;
    }

    function setAasSeven() public{
        a = 7;
    }

    function setAasNine() public {
        a = 9;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getB() public view returns(uint) {
        return b;
    }

    function getC() public view returns(uint) {
        return c;
    }

    function getAB() public view returns(uint, uint){
        return (a, b);
    }
}