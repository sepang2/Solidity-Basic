// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract VISIBILITY {
    uint a =5;
    uint b =7;
    uint c =9;
    uint d =11;

    function privateF() private view returns(uint) {
        return a;
    }

    function testPrivateF() public view returns(uint) {
        return privateF();
    }

    function internalF() internal view returns(uint) {
        return b;
    }

    function testInternalF() public view returns(uint) {
        return internalF();
    }

    function publicF() public view returns(uint) {
        return c;
    }

    function externalF() external view returns(uint) {
        return d;
    }

    function setA(uint _a) public {
        a = _a;
    }

    function setB(uint _b) public {
        b = _b;
    }

    function setC(uint _c) public {
        c = _c;
    }

    function setD(uint _d) public {
        d = _d;
    }
}

contract Child is VISIBILITY {
    function internal_C() public view returns(uint) {
        return internalF();
    }

    function public_C() public view returns(uint) {
        return publicF();
    }

    function private_C() public view returns(uint) {
        return testPrivateF();
    }
}

contract Outsider {
    VISIBILITY vs = new VISIBILITY();

    function publicF_o() public view returns(uint) {
        return vs.publicF();
    }

    function externalF_o() public view returns(uint) {
        return vs.externalF();
    }
}