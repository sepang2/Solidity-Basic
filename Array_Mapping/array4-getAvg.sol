// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// array(평균 구하기)
contract Solidity_231222 {
    uint[] nums;

    function pushNum(uint _num) public {
        nums.push(_num);
    }

    function getNums() public view returns(uint[] memory) {
        return nums;
    }

    function getNum(uint _i) public view returns(uint) {
        return nums[_i - 1];
    }

    function getAverage() public view returns(uint) {
        uint sum;

        for(uint i = 0; i < nums.length; i++) {
            sum += nums[i];
        }

        return sum/nums.length;
    }    

    function getAverage2() public view returns(uint) {
        uint sum;

        for(uint i = 0; i < nums.length; i++) {
            sum += getNum(i + 1);
        }

        return sum/nums.length;
    }    
}