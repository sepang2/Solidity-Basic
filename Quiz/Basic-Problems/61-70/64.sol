// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 64. 지갑 주소를 넣으면 5개의 4bytes로 분할하여 반환해주는 함수를 구현하세요.
contract Q64 {
    function split(bytes memory _addr) public pure returns(bytes[5] memory) { 
        bytes[5] memory _4bytes;

        _4bytes[0] = abi.encodePacked(_addr[0], _addr[1], _addr[2], _addr[3]);
        _4bytes[1] = abi.encodePacked(_addr[4], _addr[5], _addr[6], _addr[7]);
        _4bytes[2] = abi.encodePacked(_addr[8], _addr[9], _addr[10], _addr[11]);
        _4bytes[3] = abi.encodePacked(_addr[12], _addr[13], _addr[14], _addr[15]);
        _4bytes[4] = abi.encodePacked(_addr[16], _addr[17], _addr[18], _addr[19]);

        return _4bytes;
    }
}


/*
입력값 : 0x12345678901234
bytes끼리는 동적, 정적 상관 없이 왔다 갔다 사용 가능.
즉, 동적인 bytes를 정적인 bytes4같은 아이들로 끊어 낼 수 있음.
받아주는 bytes가 주는 bytes보다 같거나 크기만 하면 됨
*/
contract bytesTobytes1 {
    function getBytes(bytes memory _b) public pure returns(bytes1, bytes2, bytes3, bytes4, bytes10) {
        bytes1 a = bytes1(_b); // 0x12
        bytes2 b = bytes2(_b); // 0x1234
        bytes3 c = bytes3(_b); // 0x123456
        bytes4 d = bytes4(_b); // 0x12345678
        bytes10 e = bytes10(_b); // 0x12345678901234000000

        return (a, b, c, d, e);
    }
}