// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// uint256 범위 넘어가도 에러를 안일으키고 0, 1 ... 이렇게 넘어감
contract unchecked_examples {
    uint public A = 123;

    function power(uint x, uint y) external returns (uint) {
        unchecked {
            A = x ** y;
        }
    }

    function power_2(uint x, uint y) external pure returns (uint) {
        unchecked {
            return x ** y;
        }
    }

    function power2(uint x, uint y) external pure returns (uint) {
        unchecked {
            return x ** y + 1;
        }
    }

    function power3(uint x, uint y) external pure returns (uint) {
        return x ** y;
    }
}
