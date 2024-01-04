// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
간단한 게임이 있습니다.
유저는 번호, 이름, 주소, 잔고, 점수를 포함한 구조체입니다. 
참가할 때 참가비용 0.01ETH를 내야합니다. (payable 함수)
4명까지만 들어올 수 있는 방이 있습니다. (array)
선착순 4명에게는 각각 4,3,2,1점의 점수를 부여하고 4명이 되는 순간 방이 비워져야 합니다.

예) 
방 안 : "empty" 
-- A 입장 --
방 안 : A 
-- B, D 입장 --
방 안 : A , B , D 
-- F 입장 --
방 안 : A , B , D , F 
A : 4점, B : 3점 , D : 2점 , F : 1점 부여 후 
방 안 : "empty" 

유저는 10점 단위로 점수를 0.1ETH만큼 변환시킬 수 있습니다.
예) A : 12점 => A : 2점, 0.1ETH 수령 // B : 9점 => 1점 더 필요 // C : 25점 => 5점, 0.2ETH 수령

* 유저 등록 기능 - 유저는 이름만 등록, 번호는 자동적으로 순차 증가, 주소도 자동으로 설정, 점수도 0으로 시작
* 유저 조회 기능 - 유저의 전체정보 번호, 이름, 주소, 점수를 반환. 
* 게임 참가시 참가비 제출 기능 - 참가시 0.01eth 지불 (돈은 smart contract가 보관)
* 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전
* 관리자 인출 기능 - 관리자는 0번지갑으로 배포와 동시에 설정해주세요, 관리자는 원할 때 전액 혹은 일부 금액을 인출할 수 있음 (따로 구현)
---------------------------------------------------------------------------------------------------
* 예치 기능 - 게임할 때마다 참가비를 내지 말고 유저가 일정금액을 미리 예치하고 게임할 때마다 자동으로 차감시키는 기능.
*/

contract Test5_240102 {
    // 관리자는 0번지갑으로 배포와 동시에 설정해주세요,
    address payable owner;

    constructor() {
        owner = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You are not owner");
        _;
    }

    // 유저는 번호, 이름, 주소, 잔고, 점수를 포함한 구조체입니다.
    struct User {
        uint num;
        string name;
        address payable addr;
        uint bal;
        uint score;
    }

    mapping(address => User) public user_info; // mapping 쓸거면 idx 필요(번호 자동 증가 있어서)
    uint public idx = 1;
    
    // 4명까지만 들어올 수 있는 방이 있습니다. (array)
    address[] room;
    
    // * 유저 등록 기능 - 유저는 이름만 등록, 번호는 자동적으로 순차 증가, 주소도 자동으로 설정, 점수도 0으로 시작
    function register(string memory _name) public {
        user_info[msg.sender] = User(idx++, _name, payable(msg.sender), 0, 0);
    }

    // * 유저 조회 기능 - 유저의 전체정보 번호, 이름, 주소, 점수를 반환. 
    function search(address _addr) public view returns(User memory) {
        return user_info[_addr];
    }

    // * 게임 참가시 참가비 제출 기능 - 참가시 0.01eth 지불 (돈은 smart contract가 보관)
    function joinGame() public payable { 
        require(msg.value == 0.01 ether || user_info[msg.sender].bal >= 0.01 ether, "put 0.01ETH please");

        if(msg.value == 0) {
            user_info[msg.sender].bal -= 0.01 ether;
        }

        // 꽉 찼는지 확인
        if(room.length == 4) {
            // 점수 배분
            for(uint i = 0; i < 4; i++) {
                user_info[room[i]].score += 4 - i;
            }

            // 방 초기화
            delete room;
        }

        room.push(msg.sender);
    }

    // * 점수를 돈으로 바꾸는 기능 - 10점마다 0.1eth로 환전
    // 항상 내가 주는거 먼저 말고 내가 받는거 먼저 코드 작성(=깎을거 먼저 깎고 주기)
    function exchange(uint _score) public {
        require(_score % 10 == 0 && user_info[msg.sender].score >= _score, "10pts = 0.1ETH");
        user_info[msg.sender].score -= 10; // 점수 깎고
        payable(msg.sender).transfer(_score / 10 * 0.1 ether); // 돈 주기
    }

    // * 점수를 돈으로 바꾸는 기능2 - 10점마다 0.1eth 환전 (최대 가능 금액 자동 환전)
    function exchangeMax() public {
        require(user_info[msg.sender].score >= 10);
        payable(msg.sender).transfer(user_info[msg.sender].score / 10 * 0.1 ether);
    }

    // * 관리자 인출 기능 - 관리자는 원할 때 전액 혹은 일부 금액을 인출할 수 있음 (따로 구현)
    function withdraw(uint _n) public onlyOwner {
        require(_n <= address(this).balance, "Not enough money");
        owner.transfer(_n * 0.01 ether);
    }

    function withdraw_all() public onlyOwner {
        owner.transfer(address(this).balance);
    }

    // * 예치 기능 - 게임할 때마다 참가비를 내지 말고 유저가 일정금액을 미리 예치하고 게임할 때마다 자동으로 차감시키는 기능.
    function deposit() public payable {
        user_info[msg.sender].bal += msg.value;
    }
}