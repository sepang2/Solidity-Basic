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

    // 실행마다 상태변수 변경돼서 가스비 많이 나옴
    function descending() public {
        for(uint i = 0; i < nums.length; i++) {
            for(uint j = i + 1; j < nums.length; j++) {
                if(nums[i] < nums[j]) {
                    (nums[i], nums[j]) = (nums[j], nums[i]);
                }
            }
        }
    }

    // 새로 지역변수 선언해서 상태변수 값을 넣어준 뒤에 지역변수로만 갖고 놀면 가스비 절약 가능
    function descending2() public view returns(uint[] memory){
        uint[] memory _nums = nums;

        for(uint i = 0; i < _nums.length; i++) {
            for(uint j = i + 1; j < _nums.length; j++) {
                if(_nums[i] < _nums[j]) {
                    (_nums[i], _nums[j]) = (_nums[j], _nums[i]);
                }
            }
        }
        return _nums;
    }

    // 가스비 신경X
    function ascending() public {
        for(uint i = 0; i < nums.length; i++) {
            for(uint j = i + 1; j < nums.length; j++) {
                if(nums[i] > nums[j]) {
                    (nums[i], nums[j]) = (nums[j], nums[i]);
                }
            }
        }
    }

    // 가스비 절약 버전
    function ascending2() public view returns(uint[] memory){
        uint[] memory _nums = nums;

        for(uint i = 0; i < _nums.length; i++) {
            for(uint j = i + 1; j < _nums.length; j++) {
                if(_nums[i] > _nums[j]) {
                    (_nums[i], _nums[j]) = (_nums[j], _nums[i]);
                }
            }
        }
        return _nums;
    }
}