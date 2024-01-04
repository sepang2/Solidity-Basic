// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract DAD {
    function getMSGSender() virtual public view returns(address) {
        return msg.sender;
    }
}

contract MOM {
    DAD public husband = new DAD();

    function getMSGSender() public view returns(address) {
        return msg.sender;
    }

    function getHusbandMSGSender() public view returns(address) {
        return husband.getMSGSender();
    }
}

contract CHILD is DAD {
    function getMSGSender() override public view returns(address) {
        return msg.sender;
    }

    function fathersMSGSender() public view returns(address) {
        return super.getMSGSender();
    }

    function fathersMSGSender2() public view returns(address) {
        return DAD.getMSGSender();
    }
}