// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 40. 숫자를 임의로 넣었을 때 오름차순으로 정렬하고 가장 가운데 있는 숫자를 반환하는 함수를 구현하세요. 가장 가운데가 없다면 가운데 2개 숫자를 반환하세요.    
// 예) [5,2,4,7,1] -> [1,2,4,5,7], 4 // [1,5,4,9,6,3,2,11] -> [1,2,3,4,5,6,9,11], 4,5 // [6,3,1,4,9,7,8] -> [1,3,4,6,7,8,9], 6
contract Q40 {
    uint[] arr;

    function pushNum(uint[] memory _nums) public {
        arr = _nums;
    }

    function getMedian() public view returns(uint[2] memory) {
        uint[] memory _arr = arr;
        uint[2] memory _median;

        for(uint i = 0; i < _arr.length; i++) {
            for(uint j = i + 1; j < _arr.length; j++) {
                if(_arr[i] > _arr[j]) {
                    (_arr[i], _arr[j]) = (_arr[j], _arr[i]);
                }
            }
        }

        // return값 개수를 조건에 따라 조절 가능?
        if(_arr.length % 2 == 1) {
            _median[0] = _arr[_arr.length / 2];
            return _median;
        } else {
            _median[0] = _arr[_arr.length / 2 - 1];
            _median[1] = _arr[_arr.length / 2];
            return _median;
        }
    }
}