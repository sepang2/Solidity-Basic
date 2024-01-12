// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract REQUIRE2 {
    function require2_1() public pure returns(uint) {
        uint a = 1;
        bool b;

        require(b, "go back");
        return a;
    }

    function require2_2() public pure returns(uint) {
        uint a = 1;
        bool b;

        return a;
        require(b, "go back"); // require라도 return 뒤는 접근 불가
    }   
}