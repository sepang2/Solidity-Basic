// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// 이중 매핑
contract MAPPING {
    mapping(string => mapping(string => uint)) accounts;

    function setAccount(string memory _name, string memory _bank, uint _amount) public {
        accounts[_name][_bank] = _amount;
    }

    function getAccount(string memory _name, string memory _bank) public view returns(uint) {
        return accounts[_name][_bank];
    }
}