// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;


// constructor가 있는 contract를 상속하는 경우
contract A {
    uint public a;
    uint public b;

    constructor(uint _a, uint _b) {
        a = _a;
        b = _b;
    }
}

// A 컨트랙트 상속 => a=4, b=10 반환
contract B is A(4, 10) {
    // ,,,
}

// 상속이 아닌 visibility로 우회해서 A 컨트랙트에 접근
contract C {
    // 새롭게 선언한 a, b의 주소 확인하려고 public 작성
    A public C_a = new A(5, 10);  // A컨트랙트를 C_a변수명으로 새로 배포 => a=5, b=10 반환
    A public C_b; // A컨트랙트를 C_b변수명으로 선언, 배포X => 그래서 값 보면 주소가 0x000...으로 나옴
    
    // C_b 변수명으로 새로 배포 => a=_a, b=_b 반환
    function setC_b(uint _a, uint _b) public {
        C_b = new A(_a, _b);
    }
}

contract W {
    address public a;
    address public b;
}