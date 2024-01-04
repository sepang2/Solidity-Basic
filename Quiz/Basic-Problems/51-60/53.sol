// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 53. 시중에는 A,B,C,D,E 5개의 은행이 있습니다.
// 각 은행에 고객들은 마음대로 입금하고 인출할 수 있습니다.
// 각 은행에 예치된 금액 확인, 입금과 인출할 수 있는 기능을 구현하세요.
// 힌트 : 이중 mapping을 꼭 이용하세요.
contract Q53 {
    mapping(address => uint) user_balance;

    function deposit() public payable {}
    
    function withdraw(uint _n) public {
        require(user_balance[msg.sender] >= _n, "Not enough money");
        user_balance[msg.sender] -= _n;
        payable(msg.sender).transfer(_n);
    }

    function balanceCheck() public view returns(uint) {
        return user_balance[msg.sender];
    }
}