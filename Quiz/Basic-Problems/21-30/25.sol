// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 25. 배열 A를 선언하고 해당 배열에 n부터 0까지 자동으로 넣는 함수를 구현하세요. 
/*
solidity에서는 보통 uint를 선언하므로
i-- 사용 시 음수가 되어 오류가 날 수 있는 점을 항상 생각.
*/
contract Q25 {
    uint[] A;

    function pushNum(uint _n) public returns(uint[] memory) {
        for(uint i = _n + 1; i > 0; i--) {
            A.push(i - 1);
        }

        return A;
    }

    function pushNum2(uint _n) public returns(uint[] memory) {
        for(uint i = _n; i >= 0; i--) {
            A.push(i);

            if(i == 0) {
                break;
            }
        }

        return A;
    }

    function pushNum3(uint _n) public returns(uint[] memory) {
        for(uint i = 0; i <= _n; i++) {
            A.push(_n - i);
        }

        return A;
    }
}