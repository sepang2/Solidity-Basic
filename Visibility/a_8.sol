// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract DAD {
    uint public a;
    uint[] public b;

    function getAddress() public view returns(address) {
        return address(this);
    }

    function setA(uint _n) public {
        a = _n;
    }

    function setB(uint[] memory _b) public {
        b = _b;
    }
}

/*
1. husband, husband2 주소 확인
2. 복사해서 dad contract 각각 주소에 배포하기(at address 이동)
3. dad, dad2에 변수 변경하기
4. getH1a, getH1b, getH2a, getH2b 함수로 변경된 변수 확인
*/

contract MOM {
    DAD public husband = new DAD();
    DAD public husband2 = new DAD();

    // 상태변수를 public으로 선언하면 아래와 같이 함수처럼 쓸 수 있음
    function getH1a() public view returns(uint) {
        return husband.a();
    }

    function getH1b() public view returns(uint) {
        return husband.b(1);
    }

    function getH2a() public view returns(uint) {
        return husband2.a();
    }

    function getH2b() public view returns(uint) {
        return husband2.b(1);
    }
}