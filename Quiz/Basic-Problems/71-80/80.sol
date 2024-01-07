// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 80. 지금은 동적 array에 값을 넣으면(push) 가장 앞부터 채워집니다.
// 1,2,3,4 순으로 넣으면 [1,2,3,4] 이렇게 표현됩니다.
// 그리고 값을 빼려고 하면(pop) 끝의 숫자부터 빠집니다. 가장 먼저 들어온 것이 가장 마지막에 나갑니다.
// 이런 것들을 FILO(First In Last Out)이라고도 합니다. 가장 먼저 들어온 것을 가장 먼저 나가는 방식을 FIFO(First In First Out)이라고 합니다.
// push와 pop을 이용하되 FIFO 방식으로 바꾸어 보세요.
contract Q80 {
    uint[] arr;
    
    function push(uint _n) public {
        arr.push(_n);
    }

    function popFIFO() public {
        for(uint i = 0; i < arr.length - 1; i++) {
            (arr[i], arr[i + 1]) = (arr[i + 1], arr[i]);
        }
        arr.pop();
    }

    function getArr() public view returns(uint[] memory) {
        return arr;
    }
}