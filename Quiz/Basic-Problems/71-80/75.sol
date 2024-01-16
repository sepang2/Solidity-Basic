// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 75. 문자열을 넣으면 n번 반복하여 쓴 후에 반환하는 함수를 구현하세요.
// 예) abc,3 -> abcabcabc // ab,5 -> ababababab
contract Q75 {
    function repeat(string memory _s, uint _n) public pure returns(string memory) {
        string memory _result;
        while(--_n != 0) {
            _result = string.concat(_result, _s); // _result = string(abi.encodePacked(_result, _s));
        }

        return _result;
    }

    // string concat 없던 때 bytes를 이용한 방법
    function repeatStrings(string memory _s, uint _n) public pure returns(string memory) {
        uint length = bytes(_s).length * _n;
        bytes memory res = new bytes(length);

        uint idx = 0;

        for(uint i = 0; i < _n; i++) {
            for(uint j = 0; j < bytes(_s).length; j++) {
                res[idx++] = bytes(_s)[j];
            }
        }

        return string(res);
    }
}