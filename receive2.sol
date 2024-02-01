// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract payable_1 {
    receive() external payable {}

    function regular(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }
}

contract payable_2 {
    function regular(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }
}

/*
위의 각 CA address 넣어서 돈 보내보면,
payable_1은 받을 수 있고, payable_2는 오류가 뜬다.

둘 다 transfer_money()에 의해 각 CA가 호출되는데 methodID 없이 호출되었기 때문에 오류가 생기는 상황.
이 때, payable_1은 methodID 없이 호출되는 상황의 예외처리가 가능한 receive()를, 외부에서 접근할 수 있도록 external를, 돈을 받을 수 있는 payable를
사용하여 payable_1에게는 돈을 보낼 수 있게 되는 것.
*/
contract SENDING {
    function deposit() public payable {}

    function transfer_money(address payable _addr, uint _n) public {
        _addr.transfer(_n);
    }
}