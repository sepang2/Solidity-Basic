// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// local variable로 사용하기
// 특정 array에서 짝수만 추출하기
contract Solidity_231222 {
    uint[] nums;

    function pushNum(uint _num) public {
        nums.push(_num);
    }

    function getNums() public view returns(uint[] memory) {
        return nums;
    }    

    function getOddsCount() public view returns(uint) {
        uint index;
        
        for(uint i = 0; i < nums.length; i++) {
            if(nums[i] % 2 == 0) {
                index++;
            }
        }

        return index;
    }

    function getOdds() public view returns(uint[] memory) {
        uint[] memory _odd = new uint[](getOddsCount());
        uint index;

        for(uint i = 0; i < nums.length; i++){
            if(nums[i] % 2 == 0){
                _odd[index] = nums[i];
                index++;
            }
        }

        return _odd;
    }

    function getOdds2() public view returns(uint[] memory) {
        uint[] memory _odd = new uint[](10);
        uint index;

        for(uint i = 0; i < nums.length; i++){
            if(nums[i] % 2 == 0){
                _odd[index] = nums[i];
                index++;
            }
        }

        return _odd;
    }
    
    function getOdds3() public view returns(uint[10] memory) {
        uint[10] memory _odd;
        uint index;

        for(uint i = 0; i < nums.length; i++){
            if(nums[i] % 2 == 0){
                _odd[index] = nums[i];
                index++;
            }
        }

        return _odd;
    }
}