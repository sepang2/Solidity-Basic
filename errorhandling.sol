// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 오류 종류에는 panic, error가 있음
contract EH1 {
    /*
    require 조건이 true여야 통과.
    오류는 error를 발생시킴.
    - Error occured: revert.
    - execution cost: 730
    */
    function REQUIRE(uint _n) public pure returns(uint) {
        require(_n > 10, "Nope");
        return _n;
    }

    /*
    revert는 조건이 필요 없음. 그냥 마주치면 멈추는 것.
    오류는 error를 발생시킴.
    - Error occured: revert.
    - execution cost: 689
    */
    function REVERT(uint _n) public pure returns(uint) {
        if(_n < 10) {
            revert("lower than 10");
        }

        return _n;
    }

    /*
    assert 조건이 true여야 통과
    오류는 panic을 일으킴.
    내부적 에러 용도로만 사용을 권장함.
    
    0.7.0 버전까지는 가스비 환불 안하는 단점이 있었음.
    - Error occured: invalid opcode.
    - execution cost: 2978796

    0.8.0 버전부터는 가스비 환불해주는 것으로 업데이트 됨.
    - Error occured: revert.
    - execution cost: 451
    */
    function ASSERT(uint _n) public pure returns(uint) {
        assert(_n < 10);
        return _n;
    }
}