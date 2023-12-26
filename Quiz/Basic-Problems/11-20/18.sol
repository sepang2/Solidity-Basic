// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 18. 이름을 검색하면 생일이 나올 수 있는 자료구조를 구현하세요.
// (매핑) 해당 자료구조에 정보를 넣는 함수, 정보를 볼 수 있는 함수도 구현하세요.
contract Q18 {
    mapping(string => uint) birthday;

    function setBirthday(string memory _name, uint _birthday) public {
        birthday[_name] = _birthday;
    }

    function getBirthday(string memory _name) public view returns(uint) {
        return birthday[_name];
    }
}