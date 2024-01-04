// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract DAD {
    function getAddress() virtual public view returns(address) {
        return address(this);
    }
}

// DAD 컨트랙트를 husband이름으로 새롭게 선언했기 때문에
// husband와 MOM의 주소가 다름
contract MOM {
    DAD public husband = new DAD();

    function getAddress() public view returns(address) {
        return address(this);
    }

    function getHusbandAddress() public view returns(address) {
        return husband.getAddress();
    }

    function getHusbandAddress2() public view returns(address) {
        return address(husband);
    }
}

// 그냥 단순하게 상속했기 때문에 복붙한거랑 똑같음
// 3개 함수 모두 같은 CHILD 컨트랙트 주소가 나옴
contract CHILD is DAD {
    function getAddress() override public view returns(address) {
        return address(this);
    }

    function fathersAddress() public view returns(address) {
        return super.getAddress();
    }

    function fathersAddress2() public view returns(address) {
        return DAD.getAddress();
    }
}