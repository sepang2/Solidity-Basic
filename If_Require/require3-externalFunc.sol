// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract REQUIRE3 {
    uint a;

    function setAasFive() public {
        a = 5;
    }

    function getInput(uint _n) public {
        setAasFive(); // 외부함수 호출도 require에 걸리면 무의미
        require(_n >= 10, "go back");
    }

    function getA() public view returns(uint) {
        return a;
    }
}