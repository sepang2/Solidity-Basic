// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 30. 임의대로 숫자를 넣으면 알아서 내림차순으로 정렬해주는 함수를 구현하세요
// (sorting 코드 응용 → 약간 까다로움)
// 예 : [2,6,7,4,5,1,9] → [9,7,6,5,4,2,1]
contract Q30 {
    uint[] arr;

    function pushNum(uint _n) public {
        arr.push(_n);
    }

    function getNum() public view returns(uint[] memory) {
        return arr;
    }
    
    function descending() public view returns(uint[] memory) {
        uint[] memory _arr = arr;

        for(uint i = 0; i < _arr.length; i++) {
            for(uint j = i + 1; j < _arr.length; j++) {
                if(_arr[i] < _arr[j]) {
                    (_arr[i], _arr[j]) = (_arr[j], _arr[i]);
                }
            }
        }
        return _arr;
    }
}