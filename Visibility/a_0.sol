// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 접근성 - private, internal, public, external
contract VISIBILITY {
    function privateF() private pure returns(string memory) {
        return "private";
    }

    // function testPrivateF() public pure returns(string memory) {
    //     return privateF();
    // }

    function internalF() internal pure returns(string memory) {
        return "internal";
    }

    // function testInternalF() public pure returns(string memory) {
    //     // require(msg.sender == owner); // 나만 확인해야 하기 때문에 가장 일반적으로 이렇게 require 걸어줌
    //     return internalF();
    // }

    function publicF() public pure returns(string memory) {
        return "public";
    }

    function exteranlF() external pure returns(string memory) {
        return "external";
    }
}

// 상속된 contract에서 접근 가능성 확인
// 상속 받는 놈 is 상속 하는 놈
contract Child is VISIBILITY {
    function public_C() public pure returns(string memory) {
        return publicF();
    }

    // internal은 상속된 contract에서 접근 가능
    function internal_C() public pure returns(string memory) {
        return internalF();
    }

    /*
    // private은 상속된 contract에서 접근 불가 -> 오류뜸
    function private_C() public pure returns(string memory) {
        return privateF();
    }
    */

    /*
    // external도 상속된 contract에서 접근 불가 -> 오류
    function external_C() public pure returns(string memory) {
        return externalF();
    }
    */
}

// 외부에서 접근 가능한지 확인 + 외부에서 function 사용 방법
contract Outsider {
    // VISIBILITY형 변수 vs 선언 (VISIBILITY 함수에 접근하려고)
    VISIBILITY vs = new VISIBILITY();

    function publicF_o() public view returns(string memory) {
        return vs.publicF();
    }

    function externalF_o() public view returns(string memory) {
        return vs.exteranlF();
    }

    /*
    // internal은 외부에서 접근 불가
    function internalF_o() public view returns(string memory) {
        return vs.internalF();
    }
    */
}