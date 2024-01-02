// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 27. string 과 bytes32를 key-value 쌍으로 묶어주는 mapping을 구현하세요.
// 해당 mapping에 정보를 넣고, 지우고 불러오는 함수도 같이 구현하세요.
contract Q27 {
    mapping(string => bytes32) info;

    // 64자리 입력하기 힘들어서 그냥 keccak썼음
    function setInfo(string memory _s) public {
        info[_s] = keccak256(bytes(_s));
    }

    function deleteInfo(string memory _s) public {
        delete info[_s];
    }
    
    function getInfo(string memory _s) public view returns(bytes32) {
        return info[_s];
    }
}