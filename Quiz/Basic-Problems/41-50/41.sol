// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 41. 숫자만 들어갈 수 있으며 길이가 4인 배열을 (상태변수로)선언하고 그 배열에 숫자를 넣는 함수를 구현하세요.
// 배열을 초기화하는 함수도 구현하세요. (길이가 4가 되면 자동으로 초기화하는 기능은 굳이 구현하지 않아도 됩니다.)
contract Q41 {
    uint[4] nums;
    uint idx;

    function setNums(uint _n) public {
        nums[idx] = _n;
        idx++;
    }

    function initialize() public {
        delete nums;
        
        if(idx > 3) {
            idx = 0;
        }
    }

    function getNums() public view returns(uint[4] memory) {
        return nums;
    }
}