// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
로또 프로그램을 만드려고 합니다. 
숫자와 문자는 각각 4개 2개를 뽑습니다.
숫자가 순서와 함께 6개가 맞으면 1이더, 5개가 맞으면 0.75이더, 4개가 맞으면 0.25이더, 3개가 맞으면 0.1이더 2개 이하는 상금이 없습니다. 

참가 금액은 0.05이더이다.

기준 숫자 : 1,2,3,4,A,B
*/

import "@openzeppelin/contracts/utils/Strings.sol";

contract Test9_240124 {
    function depositForTest() public payable {}

    function Lottery(uint _a, uint _b, uint _c, uint _d, string memory _e, string memory _f) public payable {
        require(msg.value == 0.05 ether, "put 0.05ETH please");        
        
        string[6] memory win;
        (win[0], win[1], win[2], win[3], win[4], win[5]) = ("1", "2", "3", "4", "A", "B");
        
        string[6] memory _pick;
        (_pick[0], _pick[1], _pick[2], _pick[3], _pick[4], _pick[5]) = (Strings.toString(_a), Strings.toString(_b), Strings.toString(_c), Strings.toString(_d), _e, _f);

        uint cnt;
        for(uint i = 0; i < 6; i++) {
            if(keccak256(bytes(win[i])) == keccak256(bytes(_pick[i]))) {
                cnt++;
            }
        }

        if(cnt == 6) {
            payable(msg.sender).transfer(1 ether);
        } else if(cnt == 5) {
            payable(msg.sender).transfer(0.75 ether);
        } else if(cnt == 4) {
            payable(msg.sender).transfer(0.25 ether);
        } else if(cnt == 3) {
            payable(msg.sender).transfer(0.1 ether);
        } else {
            payable(msg.sender).transfer(0);
        }
    }
}