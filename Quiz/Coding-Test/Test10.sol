// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
주차정산 프로그램을 만드세요.
주차시간 첫 2시간은 무료, 그 이후는 1분마다 200원(wei)씩 부과합니다.
주차료는 차량번호인식을 기반으로 실행됩니다. 차량에 대한 구조체도 만들어주세요.
차량번호는 필수적으로 구현되어야 할 겁니다.
*/

contract Test10_240126 {
    enum status {
        In,
        Out
    }

    struct CarInfo {
        uint num;
        address owner;
        uint time;
        uint payment;
    }

    status CarStatus;
    mapping(uint => CarInfo) public car;

    function In(uint _carNum) public {
        require(car[_carNum].time == 0 && CarStatus == status.Out, "Already In");
        car[_carNum] = CarInfo(_carNum, msg.sender, block.timestamp, 0);
        CarStatus = status.In;
    }
    
    function Out(uint _carNum) public payable {
        require(car[_carNum].time != 0 && CarStatus == status.In, "Not in a parking lot");
        if(car[_carNum].time + 2 hours >= block.timestamp) {
            car[_carNum].time = 0;
        } else {
            uint t = (block.timestamp - car[_carNum].time - 2 hours) / 60 + 1;
            // car[_carNum].owner.transfer(t * 200 wei);
            car[_carNum].payment = 200 wei;
            car[_carNum].time = 0;
        }
    }

    function deposit() public payable {} // test용
}

contract Test10_Answer {
    struct car {
        address addr;
        uint time;
    }

    mapping(uint => car) public costs;

    function enter(uint _number) public {
        costs[_number] = car(msg.sender, block.timestamp);
    }

    function exit(uint _number) public {
        pay(costs[_number].time);
        costs[_number].time = 0;
        costs[_number].addr = address(0); // 반납 기능. (렌트카 서비스 내용의 문제로도 사용 가능)
    }

    function pay(uint _start) public payable {
        uint used = block.timestamp - _start - 2 hours;

        if(used % 60 != 0) {
            require(msg.value == (used / 60 + 1) * 200, "Not enough money");
        } else {
            require(msg.value == used / 60 * 200, "Not enough money");
        }
    }

    function cal(uint _number) public view returns(uint) {
        uint used = block.timestamp - costs[_number].time - 2 hours;

        if(used % 60 != 0) {
            return (used / 60 + 1) * 200;
        } else {
            return used / 60 * 200;
        }
    }
}