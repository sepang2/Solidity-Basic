// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// method ID(=selector) 구하기
contract Method_ID {
    function getMethodId(string calldata _a) public pure returns (bytes4) {
        return bytes4(keccak256(bytes(_a)));
    }

    // return this.같은 컨트랙트 내의 함수명.selector;
    // 아래는 getMethodId(string)의 method ID 반환.
    function getMethodID2() public pure returns (bytes4) {
        return this.getMethodId.selector;
    }
}

/*
input : deposit() output : 0xd0e30db0
input : setA(uint) output : 0xee919d50
input : withdraw_1() output : 0xc035340c
input : withdraw_all() output : 0xdd473d2b
input : addBlackList(address) output : 0xecb93c0
*/
