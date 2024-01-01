// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 43. 은행의 역할을 하는 contract를 만드려고 합니다. 별도의 고객 등록 과정은 없습니다.
// 해당 contract에 ether를 예치할 수 있는 기능을 만드세요.
// 또한, 자신이 현재 얼마를 예치했는지도 볼 수 있는 함수 그리고 자신이 예치한만큼의 ether를 인출할 수 있는 기능을 구현하세요.
// 힌트 : mapping을 꼭 이용하세요.
contract Q43 {
    mapping(address => uint) ETH;

    function deposit() public payable {
        ETH[msg.sender] += msg.value;
    }

    function getMyBalance() public view returns(uint) {
        return ETH[msg.sender];
    }

    function withdraw(uint _n) public {
        require(_n * 1e18 <= getMyBalance(), "Not enough ETH!");
        payable(msg.sender).transfer(_n * 1e18);
        ETH[msg.sender] -= _n * 1e18;
    }
}