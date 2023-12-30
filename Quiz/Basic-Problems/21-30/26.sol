// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 26. 홀수만 들어가는 array, 짝수만 들어가는 array를 구현하고 숫자를 넣었을 때 자동으로 홀,짝을 나누어 입력시키는 함수를 구현하세요.
contract Q26 {
    uint[] odd;
    uint[] even;

    function pushNum(uint _n) public {
        if(_n % 2 == 0) {
            even.push(_n);
        } else {
            odd.push(_n);
        }
    }

    function getNums() public view returns(uint[] memory, uint[] memory) {
        return (odd, even);
    }
}