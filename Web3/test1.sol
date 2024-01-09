// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// a,b,c(변수는 public 하게)를 각각 1,2,3으로 설정하고 이 변수들을 바꿀 수 있는 함수도 같이 구현

contract A {
    uint256 public a = 1;
    uint256 public b = 2;
    uint256 public c = 3;

    function setA(uint256 _a) public {
        a = _a;
    }

    function setB(uint256 _b) public {
        b = _b;
    }

    function setC(uint256 _c) public {
        c = _c;
    }
}

/*
608060405260015f556002600155600360025534801561001d575f80fd5b506102008061002b5f395ff3fe608060405234801561000f575f80fd5b5060043610610060575f3560e01c806309cdcf9b146100645780630dbe671f146100805780634df7e3d01461009e578063c3da42b8146100bc578063ee919d50146100da578063eeb4914e146100f6575b5f80fd5b61007e60048036038101906100799190610177565b610112565b005b61008861011c565b60405161009591906101b1565b60405180910390f35b6100a6610121565b6040516100b391906101b1565b60405180910390f35b6100c4610127565b6040516100d191906101b1565b60405180910390f35b6100f460048036038101906100ef9190610177565b61012d565b005b610110600480360381019061010b9190610177565b610136565b005b8060018190555050565b5f5481565b60015481565b60025481565b805f8190555050565b8060028190555050565b5f80fd5b5f819050919050565b61015681610144565b8114610160575f80fd5b50565b5f813590506101718161014d565b92915050565b5f6020828403121561018c5761018b610140565b5b5f61019984828501610163565b91505092915050565b6101ab81610144565b82525050565b5f6020820190506101c45f8301846101a2565b9291505056fea26469706673582212201d2ee7e6c5f13e484badd299b1830f795dd78af7fed91757be1c251c7e612dbd64736f6c63430008170033
*/

contract B {
    uint256 public a = 1;
    uint256 private b = 2;
    uint256 public c = 3;

    function setA(uint256 _a) public {
        a = _a;
    }

    function setB(uint256 _b) public {
        b = _b;
    }

    function setC(uint256 _c) public {
        c = _c;
    }
}

contract C {
    struct ABC {
        uint256 a;
        string b;
        bool c;
    }

    ABC public d = ABC(1, "xyz", true);

    bytes1 public x = 0x12;
    uint256 internal y = 2;
    string private z = "abcde";

    function setA(bytes1 _x) public {
        x = _x;
    }

    function setB(uint256 _y) public {
        y = _y;
    }

    function setC(string memory _z) public {
        z = _z;
    }
}

contract E {
    uint256 public a = 10;
    uint256 internal b = 20;
    uint256 private c = 30;

    function add(uint256 _a, uint256 _b) public pure returns (uint256) {
        return _a + _b;
    }

    function setA(uint256 _a) public {
        a = _a;
    }

    function setB(uint256 _b) public {
        b = _b;
    }

    function setC(uint256 _c) public {
        c = _c;
    }

    function getAB() public view returns (uint256) {
        return a + b;
    }
}
