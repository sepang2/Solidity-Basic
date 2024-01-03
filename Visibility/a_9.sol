// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract DAD {
    uint public a;
    uint[] public b;

    address owner;

    constructor() {
        owner = msg.sender;
    }

    function getAddress() public view returns(address) {
        return address(this);
    }

    function setA(uint _n) public {
        require(msg.sender == owner);
        a = _n;
    }

    function setB(uint[] memory _b) public {
        b = _b;
    }
}

/*
1. DAD를 3번 배포시킨 후에 변수 설정, 주소도 메모
예시)
// 0x5FD6eB55D12E759a21C09eF703fe0CBa1DC9d88D -> 10, [1,2,3,4,5]
// 0x7b96aF9Bd211cBf6BA5b0dd53aa61Dc5806b6AcE -> 20, [2,4,6,8,10]
// 0x3328358128832A260C76A4141e19E2A943CD4B6D -> 30, [10,20,30,40,50]

2. MOM을 배포시킨 후에 차례대로 setHusband 실행 후 getA, getB 실행해보기

3. MOM에서 setA로 변경시킨 후에 DAD와 MOM에서 각각 변경된 변수 값 확인해보기
*/

contract MOM {
    DAD husband = new DAD();

    function setHusband(address _a) public {
        husband = DAD(_a);
    }

    function getA() public view returns(uint) {
        return husband.a();
    }

    function getB(uint _n) public view returns(uint) {
        return husband.b(_n);
    }

    function setA() public {
        husband.setA(999);
    }
}