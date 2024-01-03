// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract DAD {
    // virtual = 같은 이름의 함수에 override당할 준비중
    function dad() virtual public pure returns(string memory) {
        return "dad from DAD";
    }
}

contract MOM {
    function mom() public pure returns(string memory) {
        return "mom";
    }
}

// 상속 여러개 받을 수 있다. 다중상속 가능
contract Child is DAD, MOM {
    function child() public pure returns(string memory) {
        return "child";
    }

    // 같은 이름의 virtual적힌 함수에 override(덮어씌움)
    function dad() override public pure returns(string memory) {
        return "dad from CHILID";
    }

    // 
    function mom(uint _a) public pure returns(uint) {
        return _a;
    }
}

// 상속의 상속도 가능
contract grandChild is Child {
    function gradchild() public pure returns(string memory) {
        return "grand child";
    }
}