// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 70. 번호와 이름 그리고 bytes로 구성된 고객이라는 구조체를 만드세요.
// bytes는 번호와 이름을 keccak 함수의 input 값으로 넣어 나온 output값입니다.
// 고객의 정보를 넣고 변화시키는 함수를 구현하세요.
contract Q70 {
    struct Customer {
        uint num;
        string name;
        bytes32 hashed;
    }

    Customer[] public customers;

    // keccak256은 bytes32형
    function pushCustomer(uint _num, string memory _name) public {
        bytes32 _hashed = keccak256(abi.encodePacked(_num, _name));
        
        customers.push(Customer(_num, _name, _hashed));
    }
}