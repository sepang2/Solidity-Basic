// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 38. 상태변수 a를 "A"로 설정하여 선언하세요.
// 이 함수를 "B" 그리고 "C"로 변경시킬 수 있는 함수를 각각 구현하세요.
// 단 해당 함수들은 오직 owner만이 실행할 수 있습니다. owner는 해당 컨트랙트의 최초 배포자입니다.
// (힌트 : 동일한 조건이 서로 다른 두 함수에 적용되니 더욱 효율성 있게 적용시킬 수 있는 방법을 생각해볼 수 있음)
contract Q38 {
    address owner;
    string a = "A";

    constructor() {
        owner = msg.sender;
    }

    modifier ownerOnly() {
        require(msg.sender == owner);
        _;
    }

    function setB() public ownerOnly {
        a = "B";
    }

    function setC() public ownerOnly {
        a = "C";
    }

    function getA() public view returns(string memory) {
        return a;
    }
}