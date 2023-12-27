// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/*
Mapping : 맵핑
+ 다른 자료형끼리도 가능
+ key => value 에 유리
+ gas비가 쌈 (array보다)
- 전체 길이값 반환(= return) 불가 : 전체 길이값 알고 싶으면 상태변수 선언해야 가능 array_mapping.sol참고
- for문 불가
*/

contract MAPPING {
    mapping(string => uint) age;
    mapping(string => bool) gender;

    function set_age(string memory _name, uint _age) public {
        age[_name] = _age; //MAPPING이름[key] = value
    }

    function get_age(string memory _name) public view returns(uint) {
        return age[_name];
    }

    function delete_age(string memory _name) public {
        delete age[_name];
    }

    function set_gender(string memory _name, bool _gender) public {
        gender[_name] = _gender;
    }

    function get_gender(string memory _name) public view returns(bool) {
        return gender[_name];
    }
}