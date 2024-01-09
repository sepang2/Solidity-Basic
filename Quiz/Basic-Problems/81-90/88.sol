// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 88. 아래의 코드를 보고 owner를 변경시키는 방법을 생각하여 구현하세요.
// 힌트 : 상속
contract Q88_OWNER {
	address private owner;

	constructor() {
		owner = msg.sender;
	}

    function setInternal(address _a) internal {
        owner = _a;
    }

    function getOwner() public view returns(address) {
        return owner;
    }
}