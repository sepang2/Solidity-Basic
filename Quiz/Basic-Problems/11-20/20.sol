// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 20. 숫자만 들어가는 배열을 선언하고 숫자를 넣는 함수를 구현하세요.
// 15개의 숫자가 들어가면 3의 배수 위치에 있는 숫자들을 초기화 시키는(3번째, 6번째, 9번째 등등) 함수를 구현하세요. (for 문 응용 → 약간 까다로움)
contract Q20 {
    uint[] nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

    function pushNum(uint _a) public {
        nums.push(_a);

        if(nums.length == 15) {
            for(uint i = 3; i < nums.length + 1; i+=3) {
                delete nums[i - 1];               
            }
        }
    }

    function getNum() public view returns(uint[] memory) {
        return nums;
    }
}