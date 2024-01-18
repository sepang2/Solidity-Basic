// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 78. 숫자만 들어갈 수 있는 array를 선언하세요. array 안 요소들 중 최소 하나는 10~25 사이에 있는지를 알려주는 함수를 구현하세요.
// 예) [1,2,6,9,11,19] -> true (19는 10~25 사이) // [1,9,3,6,2,8,9,39] -> false (어느 숫자도 10~25 사이에 없음)
contract Q78 {
    function range(uint[] memory _arr) public pure returns(bool) {
        uint cnt;
        for(uint i = 0; i < _arr.length; i++) {
            if(_arr[i] > 10 && _arr[i] < 25) {
                cnt++;
            }
        }
        if(cnt > 0) return true;
        else return false;
    }

    // 코드 다이어트. but 중간에 true만나면 바로 return되기 때문에 배열 끝까지 안가는 것 주의.
    function range2(uint[] memory _arr) public pure returns(bool) {
        for(uint i = 0; i < _arr.length; i++) {
            if(_arr[i] > 10 && _arr[i] < 25) {
                return true;
            }
        }
        return false;
    }

    function range3(uint[] memory _arr) public pure returns(bool) {
        bool isFalse;
        for(uint i = 0; i < _arr.length; i++) {
            isFalse = (_arr[i] > 10 && _arr[i] < 25) ? true : false;

            if(isFalse) break;
        }

        return isFalse;
    }
}