// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// Require 조건에 걸리면 거래비용 반환해줌 = 거래비용 발생X
contract REQUIRE {
    uint a;

    function require_1(uint _n) public returns(string memory) {
        a = _n;
        if(a >= 0 && a <= 2) {
            return "A";
        } else if(a >=3 && a <= 5) {
            return "B";
        } else if(a >= 6 && a <= 8) {
            return "C";
        } else if(a == 9 || a == 10) {
            return "D";
        } else {
            return "F";
        }
    }

    function require_2(uint _n) public returns(string memory) {
        require(_n <= 10, "_n should not be higher than 10.");       
        a = _n;

        if(a >= 0 && a <= 2) {
            return "A";
        } else if(a >=3 && a <= 5) {
            return "B";
        } else if(a >= 6 && a <= 8) {
            return "C";
        } else {
            return "D";
        }
    }

    // a = n이 먼저 와도 require 때문에 초기상태로 복귀.
    // require의 순서는 상관없음.
    function require_3(uint _n) public returns(string memory) {
        a = _n;
        require(_n <= 10, "_n should not be higher than 10.");       

        if(a >= 0 && a <= 2) {
            return "A";
        } else if(a >=3 && a <= 5) {
            return "B";
        } else if(a >= 6 && a <= 8) {
            return "C";
        } else {
            return "D";
        }
    }

    function getA() public view returns(uint) {
        return a;
    }
}