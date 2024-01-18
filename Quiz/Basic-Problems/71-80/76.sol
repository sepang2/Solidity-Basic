// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 76. 숫자 123을 넣으면 문자 123으로 반환하는 함수를 직접 구현하세요.

/*
Hint : uint -> bytes -> string
1. uint를 쪼개서 배열에 저장
2. uint에 48더하기
3. 더한 값을 bytes1으로 변환
4. bytes1을 합쳐서 string으로 변환
*/

contract Q76 {
    function digits(uint _n) public pure returns(uint) {
        uint _d = 1;

        while(_n >= 10) {
            _n /= 10;
            _d++;
        }

        return _d;
    }

    // 굳이 numbers[] 필요 없음. 48 더한 값 바로 bytes[]에 넣으면 됨.
    function splitnumber(uint _n) public pure returns(bytes1[] memory) {
        uint _d = digits(_n);
        // uint[] memory numbers = new uint[](_d);
        bytes1[] memory _bytes = new bytes1[](_d);

        for(uint i = 0; i < _d; i++) {
            // numbers[i] = _n / (10 ** (_d - 1 - i)) + 48;
            _bytes[i] = abi.encodePacked(_n / (10 ** (_d - 1 - i)) + 48)[31];
            _n = _n % (10 ** (_d - 1 -i));
        }
        
        return _bytes;
    }

    function concatbytes1(uint _n) public pure returns(string memory) {
        return string(abi.encodePacked(splitnumber(_n)));
    }
}
