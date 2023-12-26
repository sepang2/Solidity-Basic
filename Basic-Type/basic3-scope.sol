// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

/*
읽기 함수(거래비용X) : view - 상태변수 참조시 / pure - 지역변수만 참조시
가격 : 전역변수(global) > 상태변수(state) > 지역변수(local)
가격이 낮을 수록 자유도도 낮음 = dynamic 안됨, static 해야함
=> ex1) local array 선언하려면 array 길이 정해줘야 함(= static) = push(), pop() 안됨
*/
contract Basic3 {
    uint a; // 상태변수

    function setA(uint _a) public { // 상태변수를 변화 시킴 -> view, pure (x)
        a = _a;
    }

    function getA() public view returns(uint) { // 상태변수 a 참조 -> view
        return a;
    }

    function getB(uint _a) public pure returns(uint) { // 지역변수만 사용 -> pure
        uint _b = _a**3;
        return(_a + _b);
    }

    function getAplusB(uint _b) public view returns(uint) { // 상태변수 a 참조 -> view
        return (a + _b);
    }
}

