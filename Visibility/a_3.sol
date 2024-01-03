// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract DAD {
    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }
}

contract MOM {
    function who() virtual public pure returns(string memory) {
        return "mom";
    }
}

// 상속하는 contract들(DAD, MOM)의 함수의 이름이 같을 때, override(컨트랙트명1, 컨트랙트명2)
// 컨트랙트명.함수명()으로 골라서 사용 가능
contract Child is DAD, MOM {
    function who() virtual override(DAD, MOM) public pure returns(string memory) {
        return DAD.who();
    }
}

// 상속의 상속인데 또 똑같은 이름일 때 (거의 존재 안하는 억지 상황)
// -> 위의 컨트랙트처럼 virtual과 override 같이 쓰는 경우도 있음
contract GrandChild is Child {
    function who() override(Child) public pure returns(string memory) {
        // return Child.who();  // => output: dad from DAD
        // return DAD.who();   // 상속의 상속이지만 바로 접근 가능
        return "grandchild";
    }
}
