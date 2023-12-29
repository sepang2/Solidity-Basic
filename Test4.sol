// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 자동차를 운전하려고 합니다.
 
contract Test4_231228 {
    constructor() {

    }

    // 자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.
    // 정지는 속도가 0인 상태, 운전 중은 속도가 있는 상태이다.
    enum Status {
        Stop,
        Moving,
        TurnedOff,
        NoFuel
    }

    Status CarStatus;
    uint speed;
    uint fuel;

    // * 악셀 기능 - 속도를 1 올리는 기능, 악셀 기능을 이용할 때마다 연료가 2씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 속도가 70이상이면 악셀 기능은 더이상 못씀
    function accel() public returns(uint, uint) {
        require(speed < 70 && fuel > 30, "Accel is LOCKED");
        CarStatus = Status.Moving;
        speed += 1;
        fuel -= 2;

        return (speed, fuel);
    }
    
    // * 브레이크 기능 - 속도를 1 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 1씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
    function brake() public returns(uint, uint) {
        require(speed > 0, "Brake is LOCKED");
        CarStatus = Status.Moving;
        speed -= 1;
        fuel -= 1;

        return (speed, fuel);
    }

    // * 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
    function turnOff() public {
        require(speed == 0, "Speed is not 0!");
        CarStatus = Status.TurnedOff;
    }

    // * 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
    function turnOn() public {
        require(CarStatus == Status.TurnedOff, "Already turned on");
        CarStatus = Status.Stop;
    }

    // * 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨
    // 지불은 smart contract에게 함.
    function fillFuel() public payable {
        address(this).transfer(1 ether);
        fuel = 100;
    }

    function deposit() public payable {}

// ----------------------------------------------------------------------------------------
    // * 주유소 사장님은 2번 지갑의 소유자임(2번 지갑 주소 하드코딩(복붙) 하면 됨)
    //   주유소 사장님이 withdraw하는 기능
    address payable CEO;

    function withdraw() public {
        CEO.transfer(address(this).balance);
    }

    // * 지불을 미리 하고 주유시 차감하는 기능
    function prepay() public payable {}
}