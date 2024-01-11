// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// return 개수 여러개 받을 수 있음
contract RETURNS {
    function numbers() public pure returns (uint, uint, uint) {
        return (1, 2, 3);
    }

    function numbers2() public pure returns (uint, uint, uint) {
        (uint a, uint b, uint c) = numbers();

        return (a, b, c);
    }

    function numbers3() public pure returns (uint, uint) {
        (uint a, , uint c) = numbers();

        return (a, c);
    }

    function numbers4() public pure returns (uint) {
        (, uint b, ) = numbers();

        return b;
    }
}
