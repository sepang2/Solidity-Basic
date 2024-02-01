// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract typecheck {
    function isString(string memory _s) public pure returns(bool) {
        require(bytes(_s).length == 1);
        bytes1 a = bytes1(bytes(_s));

        if(0x39 >= uint8(a) && uint8(a) >= 0x30) {
            return false;
        } else if(0x5a >= uint8(a) && uint8(a) >= 0x41 || 0x7a >= uint8(a) && uint8(a) >= 0x61) {
            return true;
        } else {
            revert("go back");
        }
    }

    function isUint(string memory _s) public pure returns(bool) {
        require(bytes(_s).length == 1);
        bytes1 a = bytes1(bytes(_s));

        if(0x39 >= uint8(a) && uint8(a) >= 0x30) {
            return true;
        } else if(0x5a >= uint8(a) && uint8(a) >= 0x41 || 0x7a >= uint8(a) && uint8(a) >= 0x61) {
            return false;
        } else {
            revert("go back");
        }
    }

    function string_uint_counts(string memory _s) public pure returns(uint, uint) {
        uint length = bytes(_s).length;
        bytes1[] memory b = new bytes1[](length);

        uint uint_count;

        for(uint i = 0; i < length; i++) {
            if(isUint(string(abi.encodePacked(b[i]))) == true) {
                uint_count++;
            }
        }

        return (length - uint_count, uint_count);
    }
}