// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 41. 숫자만 들어갈 수 있으며 길이가 4인 배열을 (상태변수로)선언하고 그 배열에 숫자를 넣는 함수를 구현하세요.
// 배열을 초기화하는 함수도 구현하세요.
// 길이가 4인 상태에서 새롭게 숫자를 넣으면 초기화하고 숫자를 받는 기능
// 예) [1, 2, 3, 4] -> 1을 push -> [1]
contract Q41 {
    uint[4] nums;
    uint idx;

    function setNums(uint _n) public {
        if(idx % 4 == 0) {
            delete nums;
        }

        nums[idx % 4] = _n;
        idx++;
    }

    function getNums() public view returns(uint[4] memory) {
        return nums;
    }
}