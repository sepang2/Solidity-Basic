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

        // return값 개수를 조건에 따라 조절 가능? -> 아래 컨트랙트 확인
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

contract Q40_2 {
    // 조건에 맞는 값을 return하는 함수를 만들어서 그 함수의 값을 return하도록 하면 됨
    function getMedian(uint [] memory _a) public pure returns(uint[] memory) {
        if(_a.length % 2 == 1) {
            return getMedian_Odd(_a);
        } else {
            return getMedian_Even(_a);
        }
    } 

    // visibility 관련, 함수에 internal 쓰면 배포 시 버튼 사라짐
    function getMedian_Odd(uint[] memory _a) internal pure returns(uint[] memory) {
        _a = sorting(_a);
        uint[] memory b = new uint[](1);
        b[0] = _a[_a.length / 2];
        return b;
    }

    // visibility 관련, 함수에 private 쓰면 배포 시 버튼 사라짐
    function getMedian_Even(uint[] memory _a) private pure returns(uint[] memory) {
        _a = sorting(_a);
        uint[] memory b = new uint[](2);
        (b[0], b[1]) = (_a[_a.length / 2 - 1], _a[_a.length / 2]);
        return b;
    }

    function sorting(uint[] memory _arr) public pure returns(uint[] memory) {
        for(uint i = 0; i < _arr.length; i++) {
            for(uint j = i + 1; j < _arr.length; j++) {
                if(_arr[i] > _arr[j]) {
                    (_arr[i], _arr[j]) = (_arr[j], _arr[i]);
                }
            }
        }
        return _arr;       
    }
}