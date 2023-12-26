// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MAPPING {
    mapping(string => uint) age;
    mapping(string => bool) gender;

    function set_age(string memory _name, uint _age) public {
        age[_name] = _age; //MAPPING이름[key] = value
    }

    function get_age(string memory _name) public view returns(uint) {
        return age[_name];
    }

    function set_gender(string memory _name, bool _gender) public {
        gender[_name] = _gender;
    }

    function get_gender(string memory _name) public view returns(bool) {
        return gender[_name];
    }
}