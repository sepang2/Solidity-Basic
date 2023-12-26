// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract SORTING {
    uint[] nums;
    uint lowest = 2**256-1;
    uint biggest;

    function pushNum(uint _n) public {
        nums.push(_n);
        setLowest(_n);
        setBiggest(_n);
    }

    function setLowest(uint _n) public {
        if(lowest > _n) {
            lowest = _n;
        }
    }

    function setBiggest(uint _n) public {
        if(biggest < _n) {
            biggest = _n;
        }
    }

    function getLowest() public view returns(uint) {
        return lowest;
    }

    function getBiggest() public view returns(uint) {
        return biggest;
    }

    function returnNums() public view returns(uint[] memory) {
        return nums;
    }
}