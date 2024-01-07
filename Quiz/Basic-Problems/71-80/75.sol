// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 75. 문자열을 넣으면 n번 반복하여 쓴 후에 반환하는 함수를 구현하세요.
// 예) abc,3 -> abcabcabc // ab,5 -> ababababab
contract Q75 {
    function repeat(string memory _s, uint _n) public pure returns(string memory) {
        string memory _result;
        while(_n != 0) {
            _result = string.concat(_result, _s); // _result = string(abi.encodePacked(_result, _s));
            _n--;
        }

        return _result;
    }
}