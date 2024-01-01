// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 45. 숫자만 들어가는 array를 만들되, 100이하의 숫자만 들어갈 수 있게 구현하세요.
contract Q45 {
    uint[] arr;

    function pushArr(uint _n) public {
        require(_n <= 100, "You push over 100!");
        arr.push(_n);
    }

    function getArr() public view returns(uint[] memory) {
        return arr;
    }
}