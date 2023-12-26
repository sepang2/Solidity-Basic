// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// bytes형 => 16진수, ascii
contract Basic5 {
    bytes a;

    function setA(bytes memory _a) public {
        a = _a;
    }

    function setB() public {
        a = "ab";   // 0x6162 -> ascii code 참고
    }

    function setC(string memory _a) public {
        a = bytes(_a);  // string 형의 _a가 bytes형의 a로 저장됨
    }

    function setD() public {
        a = "12";   // 0x3132 -> ascii code 참고
    }

    function getA() public view returns(bytes memory) {
        return a;
    }
}