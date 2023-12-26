// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// string 형
contract Basic4 {
    string a; // 문자형 변수 a, 상태변수
    uint b;

    function setA(string memory _a) public {
        a = _a;
    }

    function setAasABC() public {
        a = "abc";
    }

    function setAB(string memory _a, uint _b) public {
        a = _a;
        b = _b;        
    }

    function getA() public view returns(string memory) {
        return a;
    }

    function getAB() public view returns(string memory, uint) {
        return (a, b);
    }
}