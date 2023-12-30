// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 25. 배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요. 
contract Q25 {
    uint[] A;

    function pushNum(uint _n) public {
        for(uint i = 0; i <= _n; i++) {
            A.push(i);
        }
    }

    function getA() public view returns(uint[] memory) {
        return A;
    }
}
