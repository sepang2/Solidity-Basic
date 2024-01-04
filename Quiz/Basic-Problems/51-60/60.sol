// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 60. 방이 2개 밖에 없는 펜션을 여러분이 운영합니다. 각 방마다 한번에 3명 이상 투숙객이 있을 수는 없습니다.
// 특정 날짜에 특정 방에 누가 투숙했는지 알려주는 자료구조와 그 자료구조로부터 값을 얻어오는 함수를 구현하세요.
// 예약시스템은 운영하지 않아도 됩니다. 과거의 일만 기록한다고 생각하세요.   
// 힌트 : 날짜는 그냥 숫자로 기입하세요. 예) 2023년 5월 27일 → 230527
contract Q60 {
    mapping(uint => mapping(uint => address[])) info;

    function pushInfo(uint _date, uint _roomNumber, address[] memory _list) public {
        require(_roomNumber <= 2 && _list.length <= 3);
        info[_date][_roomNumber] = _list;
    }

    function getInfo(uint _date, uint _roomNumber) public view returns(address[] memory) {
        return info[_date][_roomNumber];
    }
}

contract Q60_2 {
    struct rooms {
        address[] room1;
        address[] room2;
    }

    mapping(uint => rooms) info;

    function pushInfo(uint _date, address[] memory _list1, address[] memory _list2) public {
        require(_list1.length <= 3 && _list2.length <= 3);
        info[_date] = rooms(_list1, _list2);
    }

    function getInfo(uint _date, uint _roomNumber) public view returns(address[] memory) {
        if(_roomNumber == 1) {
            return info[_date].room1;
        } else {
            return info[_date].room2;
        }
    }
}