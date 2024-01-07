// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// concat : 문자열 합치기
contract CONCAT {
    function concat1(string memory _a, string memory _b) public pure returns(string memory) {
        return string.concat(_a, _b);
    }

    // concat()이 안되던 시절 abi.encodePacked() 사용 (0.6.0 버전 쯤?)
    function concat2(string memory _a, string memory _b) public pure returns(string memory) {
        return string(abi.encodePacked(_a, _b));
    }

    function concat3(string memory _name, string memory _age) public pure returns(string memory) {
        return string(abi.encodePacked("name : ", _name, "age : ", _age));
    }
}