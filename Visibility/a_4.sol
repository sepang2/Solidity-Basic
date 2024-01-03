// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract DAD {
    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() public pure returns(string memory) {
        return "David";
    }

    uint a;
    function setA(uint _a) public {
        a = _a;
    }

    function getA() virtual public view returns(uint) {
        return a;
    }
}

contract MOM {
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }
}

// super를 사용하여 부모에 접근 가능
contract Child is DAD{
    function who() virtual override public pure returns(string memory) {
        return super.who();
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }

    function getA() override public view returns(uint) {
        return super.getA();
    }

    function getA2() public view returns(uint) {
        return super.getA();
    }
}

// super는 다중상속 시 is뒤에 마지막으로 오는 contract의 함수를 따라감 
// is DAD, MOM이니까 MOM 따라감
// override()안의 순서는 상관X
contract Child_2 is DAD, MOM{
    function who() virtual override(DAD, MOM) public pure returns(string memory) {
        return super.who();
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }   
}

// is DAD, MOM이니까 MOM 따라감 / override() 순서 상관X
contract Child_3 is DAD, MOM{
    function who() virtual override(MOM, DAD) public pure returns(string memory) {
        return super.who();
    }
}

// is MOM, DAD이니까 DAD 따라감 / override() 순서 상관X
contract Child_4 is MOM, DAD{
    function who() virtual override(DAD, MOM) public pure returns(string memory) {
        return super.who();
    }
}

// is MOM, DAD이니까 DAD 따라감 / override() 순서 상관X
contract Child_5 is MOM, DAD{
    function who() virtual override(MOM, DAD) public pure returns(string memory) {
        return super.who();
    }
}