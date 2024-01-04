// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 53_1의 응용문제
contract TOSS {
    // mapping(address => mapping(address => uint)) public total_balance;
    address[] banks;

    function pushBanks(address _addr) public {
        banks.push(_addr);
    }

    function totalBalance() public view returns(uint) {
        uint sum;

        for(uint i = 0; i < banks.length; i++) {
            Bank b;
            b = Bank(payable(banks[i]));
            sum += b.balanceCheck2();
        }

        return sum;
    }

    function totalBalance2() public view returns(uint[] memory) {
        uint[] memory sum = new uint[](banks.length);

        for(uint i = 0; i < banks.length; i++) {
            Bank b;
            b = Bank(payable(banks[i]));
            sum[i] += b.balanceCheck2();
        }

        return sum;
    }

    function deposit(address payable _bank) public payable {
       Bank b;
       b = Bank(_bank);
       payable(b).transfer(msg.value);      
       b.deposit2(msg.value);
    }

    function getBalance(address payable _bank) public view returns(uint) {
        Bank b;
        b = Bank(_bank);
        
        return b.balanceCheck2();
    }
}

contract Bank {
    receive() external payable {}
    mapping(address => uint) user_balance;

    function deposit() public payable {
        user_balance[msg.sender] += msg.value;
    }

    function deposit2(uint _n) external {
        // requrie toss만 or white list안에 있는 사람만
        user_balance[tx.origin] += _n;
    }
    
    function withdraw(uint _n) public {
        require(user_balance[msg.sender] >= _n, "Not enough money");
        user_balance[msg.sender] -= _n;
        payable(msg.sender).transfer(_n);
    }

    function balanceCheck() public view returns(uint) {
        return user_balance[msg.sender];
    }

    function balanceCheck2() public view returns(uint) {
        return user_balance[tx.origin];
    }
}