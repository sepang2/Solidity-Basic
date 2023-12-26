// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

/*
1byte = 8bits(2진수 8자리) = 16진수 2자리
      = _ _ _ _ / _ _ _ _ = 0x _ _
bytes = 0xABCD... (길이 가변)
bytes1 = 0xAB (길이 = 2)
bytes2 = 0xABCD (길이 = 4)
bytes32 = 0xABCD... (길이 = 64)
*/
contract BYTES {
    bytes a;
    bytes1 b;
    bytes2 c;
    bytes32 d;

    function setABCD(bytes memory _a, bytes1 _b, bytes2 _c, bytes32 _d) public {
        a = _a;
        b = _b;
        c = _c;
        d = _d;
    }

    function getABCD() public view returns(bytes memory, bytes1, bytes2, bytes32) {
        return (a, b, c, d);
    }

    function setA() public {
        a = "1234";
    }
}