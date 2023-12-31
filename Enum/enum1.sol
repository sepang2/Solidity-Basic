// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/*
enum
+ 용량이 적음(uint8 로 출력)
+ 가독성 좋음
+ 상태 나타낼 때 자주 사용
*/
contract ENUM {
    enum Status {
        TurnedOff,
        Stop,
        Moving
    }

    Status CarStatus;

    function getStatus() public view returns(Status) {
        return CarStatus;
    }

    function turnOn() public {
        CarStatus = Status.Stop;
    }

    function moving() public {
        CarStatus = Status.Moving;
    }
}

contract ENUM2 {
    enum Color {
        White,
        Red,
        Yellow,
        Green
    }

    Color c;

    function getColor() public view returns(Color) {
        return c;
    }
    
    function setRed() public {
        c = Color.Red;
    }

    function setYellow() public {
        c = Color.Yellow;
    }

    function setGreen() public {
        c = Color.Green;
    }

    function setWhite() public {
        c = Color.White;
    }

    function setColor(uint _n) public {
        c = Color(_n);
    }
}
