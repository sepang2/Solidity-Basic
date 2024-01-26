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
        address payable owner;
        uint time;
        uint payment;
    }

    status CarStatus;
    mapping(uint => CarInfo) public car;

    function In(uint _carNum) public {
        require(car[_carNum].time == 0 && CarStatus == status.Out, "Already In");
        car[_carNum] = CarInfo(_carNum, payable(msg.sender), block.timestamp, 0);
        CarStatus = status.In;
    }
    
    function Out(uint _carNum) public payable {
        require(car[_carNum].time != 0 && CarStatus == status.In, "Not in a parking lot");
        if(car[_carNum].time + 2 hours >= block.timestamp) {
            car[_carNum].time = 0;
        } else {
            uint t = (block.timestamp - car[_carNum].time - 2 hours) / 60 + 1;
            payable(car[_carNum].owner).transfer(t * 200 wei);
            car[_carNum].payment = 200 wei;
            car[_carNum].time = 0;
        }
    }

    function deposit() public payable {} // test용
}