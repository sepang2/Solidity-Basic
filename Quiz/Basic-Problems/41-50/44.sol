// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 44. string만 들어가는 array를 만들되, 4글자 이상인 문자열만 들어갈 수 있게 구현하세요.
contract Q44 {
    string[] public arr;

    function pushArr(string memory _s) public {
        require(bytes(_s).length >= 4, "You push under 4 characters!");
        arr.push(_s);
    }
}