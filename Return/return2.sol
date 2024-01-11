// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 다양한 return 형태들
contract Return {
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return (a + b);
    }

    function add2(uint256 a, uint256 b) public pure returns (uint256 c) {
        c = a + b;
    }

    function cal(uint256 a, uint256 b) public pure returns (uint256, uint256) {
        return (a + b, a * b);
    }

    function cal2(uint256 a, uint256 b) public pure returns (uint256 sum, uint256 mul) {
        sum = a + b;
        mul = a * b;
    }

    function cal3(uint256 a, uint256 b) public pure returns (uint256 sum, uint256 mul) {
        (sum, mul) = (a + b, a * b);
    }
}
