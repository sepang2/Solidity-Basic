// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract DAD {
    function getAddress() public view returns(address) {
        return address(this);
    }
}

contract MOM {
    // 서로 다른 2개의 tab 띄운 후에, 새로고침하고 주소 확인해보기
    DAD husband = new DAD(); // 이래 보여도 상태변수임 -> 아래처럼 public 붙일 수 있음
    DAD public husband2 = new DAD();

    function getAddress() public view returns(address) {
        return address(this);
    }

    function h_Address() public view returns(address) {
        return address(husband);
    }

    function h_Address2() public view returns(address) {
        return husband.getAddress();
    }

    function h_Address_2() public view returns(address) {
        return address(husband2);
    }

    function h_Address2_2() public view returns(address) {
        return husband2.getAddress();
    }
}