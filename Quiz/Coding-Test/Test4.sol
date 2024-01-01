// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
자동차를 운전하려고 합니다.
자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.

정지는 속도가 0인 상태, 운전 중은 속도가 있는 상태이다. 

* 악셀 기능 - 속도를 10 올리는 기능, 악셀 기능을 이용할 때마다 연료가 20씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 70이상이면 악셀 기능은 더이상 못씀
* 브레이크 기능 - 속도를 10 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 10씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
* 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
* 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
* 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨

지불은 smart contract에게 함.
----------------------------------------------------------------------------------------
* 주유소 사장님은 2번 지갑의 소유자임(2번 지갑 주소 하드코딩(복붙) 하면 됨), 주유소 사장님이 withdraw하는 기능
* 지불을 미리 하고 주유시 차감하는 기능
*/
 
contract Test4_231228 {
    // 자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.
    // 정지는 속도가 0인 상태, 운전 중은 속도가 있는 상태이다.
    enum Status {
        Stop,
        Driving,
        TurnedOff,
        NoFuel
    }

    struct Car {
        Status CarStatus;
        uint speed;
        uint fuel; 
    }

    // * 주유소 사장님은 2번 지갑의 소유자임(2번 지갑 주소 하드코딩(복붙) 하면 됨)
    address payable CEO;
    constructor() {
        CEO = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    }

    Car myCar;
    uint paid;

    // * 악셀 기능 - 속도를 10 올리는 기능, 악셀 기능을 이용할 때마다 연료가 20씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 속도가 70이상이면 악셀 기능은 더이상 못씀
    function accel() public returns(uint, uint) {
        require(myCar.speed < 70 && myCar.fuel > 30, "Accel is LOCKED");
        require(myCar.CarStatus == Status.Driving || myCar.CarStatus == Status.Stop, "Turn on First");
        
        if(myCar.CarStatus != Status.Driving) {
           myCar.CarStatus = Status.Driving;
        }

        myCar.speed += 10;
        myCar.fuel -= 20;

        return (myCar.speed, myCar.fuel);
    }
    
    // * 브레이크 기능 - 속도를 10 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 10씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
    function brake() public returns(uint, uint) {
        require(myCar.CarStatus == Status.Driving, "Brake is LOCKED");
        
        myCar.speed -= 10;
        myCar.fuel -= 10;

        if(myCar.speed == 0) {
            myCar.CarStatus = Status.Stop;
        }

        return (myCar.speed, myCar.fuel);
    }

    // * 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
    function turnOff() public {
        require(myCar.speed == 0 || myCar.CarStatus == Status.Stop, "Stop First");
    
        myCar.CarStatus = Status.TurnedOff;
    }

    // * 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
    function turnOn() public {
        require(myCar.CarStatus == Status.TurnedOff, "Already turned on");
        
        myCar.CarStatus = Status.Stop;
    }

    // * 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨
    function fillFuel() public payable {
        require((paid >= 1 ether || msg.value == 1 ether) && myCar.CarStatus == Status.Stop, "Stop or Check your money");
        if(msg.value != 1 ether) {
            paid -= 1 ether;
        }

        myCar.fuel = 100;
    }

    // 지불은 smart contract에게 함.
    // * 지불을 미리 하고(아래 deposit()에 구현), 주유시 차감하는 기능(위 fillFuel()에 구현)
    function deposit() public payable {
        require(msg.value == 1 ether, "Not enough money");
        paid += msg.value;
    }
    
    // 주유소 사장님이 withdraw하는 기능
    function withdraw() public {
        CEO.transfer(address(this).balance);
    }
}