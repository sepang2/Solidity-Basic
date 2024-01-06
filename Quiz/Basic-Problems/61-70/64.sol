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