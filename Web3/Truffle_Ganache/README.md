# Truffle 사용하기 - 컴파일 및 배포 역할

## 원하는 폴더에서 truffle시작

truffle init

## contracts폴더 아래 컨트랙트명.sol 파일 생성

truffle create contract 컨트랙트명
ex) truffle create contract A -> /contracts/A.sol 생성

## 컴파일하기 => build 폴더 생기고 그 아래 contract명.json 생성됨

truffle compile

## 배포하기 migration

migrations 폴더 안에 .js 파일 생성하기
단 파일명이 무조건 숫자로 시작해야함. 숫자 순서대로 읽어 냄.
ex) 1_A.js, 2_second.js, 3_BBB.js => 1, 2, 3순서대로 배포.

truffle-config.js 파일에서

1. 네트워크 부분 주석 해제, 및 가나슈와 port 번호 맞추기
   networks: {
   development: {}
   }

2. local testnet을 사용할 땐 아래쪽에서 컴파일러 버전 무조건 0.8.19로 바꿔주기
   compiler: {
   solc: {
   version: "0.8.19",
   }
   }

3. truffle migrate

## 사용하기 - 트러플-가나슈는 web3.js와 비슷 / 하드햇은 ethers.js와 비슷

truffle console 로 truffle(developmen) > 진입
let 변수명 = await contract명.deployed()
변수명.함수명() 으로 함수 사용

# Ganache 사용하기 - 테스트넷 환경 제공 역할

1. contracts 탭에서 link truffle projects -> truffle projects에 truffle-config.js 추가

2. truffle에서 배포한 contract 확인하기

# Ganache 사용하기2:ganache-cli 사용하기 - 테스트넷 환경 제공 역할

ganache 터미널 버전이 ganache-cli

1. 명령어 ganache-cli로 진입 후 마지막줄에 port 번호 확인

2. truffle-config.js에서 port 번호 맞추기

---

간단정리

1. truffle init
2. 코딩(.sol, .js, config, .env)
3. truffle compile
4. truffle migrate
5. truffle console

---

# Goerli 네트워크 사용하기

1. 패키지 설치
   npm install dotenv
   npm install @truffle/hdwallet-provider@next

2. truffle-config.js line44~47쯤의 아래 부분 주석 해제
   require('dotenv').config();
   const { MNEMONIC, PROJECT_ID } = process.env;  
   const HDWalletProvider = require('@truffle/hdwallet-provider');

3. truffle-config.js line85~쯤 goerli부분 주석 해제
   goerli: {
   }

4. .env 생성 후
   MNEMONIC = 비밀복구구문 넣기
   PROJECT_ID = infura API Key

5. 컴파일 후 --network 옵션 추가하여 배포
   truffle migrate --network goerli

6. console 진입 시 --network 옵션 추가
   truffle console --network goerli
