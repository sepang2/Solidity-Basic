// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract ADDRESS {
    address a;

    function setAddress(address _a) public {
        a = _a;
    }

    function getAddress() public view returns(address) {
        return a;
    }
}

contract ADDRESS_Payable {
    address a;
    address payable b;

    function setA() public {
        a = msg.sender;
    }

    function setB() public {
        b = payable(msg.sender);
    }

    function deposit() public payable returns(uint) {
        return msg.value;
    }

    function sendToB() public {
        b.transfer(0.1 ether);
    }

    function getAB() public view returns(address, address payable) {
        return (a, b);
    }
}

contract ADDRESS_This_Balance {
    address a;

    function deposit() public payable {}

    function setA() public {
        a = msg.sender;
    }

    function getBalance() public view returns(uint) {
        return a.balance; // a의 지갑 잔고
    }

    function getBalance2() public view returns(uint) {
        return address(this).balance; // smart contract 잔고
    }

    function getAddress() public view returns(address) {
        return address(this);
    }
}

contract ADDRESS_CONSTRUCTOR {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function getOwner() public view returns(address) {
        return owner;
    }
    
    function deposit() public payable {}

    function withdraw_1() public {
        owner.transfer(1 ether);
    }

    function withdraw_all() public {
        owner.transfer(address(this).balance);
    }
}

// 이 function을(message) 실행시킨 사람이(sender) 누군지 반환하는 함수
contract MSG {
    function getMSG() public view returns(address) {
        return msg.sender;
    }
}

// 0xf2fe13e7be5edd4617fdce1b1f62ecb9ecfa9721
// 0xF2fE13E7BE5edd4617FDcE1B1f62eCB9EcFA9721
contract ADDRESS_CONSTRUCTOR2 {
    address payable owner;

    // constructor(생성자)는 배포와 동시에 실행.
    // 즉 msg(=constructor).sender(=contract 배포자)
    constructor() {
        owner = payable(msg.sender);
    }

    uint a;

    function setA(uint _a) public {
        a = _a;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }

    function add2(uint _a) public view returns(uint) {
        return _a+a;
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    function deposit() public payable {}

    function withdraw_1() public {
        owner.transfer(1 ether);
    }

    function withdraw_all() public {
        owner.transfer(address(this).balance);
    }
}