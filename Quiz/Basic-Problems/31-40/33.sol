// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 33. 이름, 번호, 지갑주소 그리고 생일을 담은 고객 구조체를 구현하세요.
//     고객의 정보를 넣는 함수와 고객의 이름으로 검색하면 해당 고객의 전체 정보를 반환하는 함수를 구현하세요.
contract Q33 {
    struct Info {
        string name;
        uint number;
        address addr;
        uint birthday;
    }

    mapping(string => Info) infoByName; 

    function setInfo(Info memory _info) public {
        infoByName[_info.name] = _info;
    }

    function getInfoByName(string memory _name) public view returns(Info memory) {
        return infoByName[_name];
    }
}