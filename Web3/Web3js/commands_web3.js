// Web3.js commands in terminal
// Web3.js 왜 사용? : 웹 브라우저 없이 체인 정보에 직접 접근하기 위해 사용
// Web3.js docs = https://web3js.readthedocs.io/en/v1.10.0/

/*
1. 기본 환경 세팅
원하는 디렉토리에서 시작
npm init
npm install web3	// 아래서 사용할 명령어들을 사용할 수 있게 패키지 설치
node
*/

var { Web3 } = require("web3");

// 사용할 수 있는 web3 명령어들 확인
web3;

// provider 사용(체인의 정보를 가져다 줌). provider는 cloudflare - ETH 메인넷 정보(기본제공)
var web3 = new Web3("https://cloudflare-eth.com");

// provider는 www.infura.io에서 제공하는 API키를 사용 - goerli 정보
var web3 = new Web3("_API Key");

// 현재 provider 정보 확인
web3.eth.provider;

// -------------------------------------------------------------------------------------------------

/*
체인과 소통 = etherscan과 멀어지기

명령어 앞에 await 혹은 맨 뒤에 .then(console.log) 붙이면 터미널에 로그 찍혀서 상세정보 다 볼 수 있음
*/

// 체인의 마지막 블록넘버 반환
await web3.eth.getBlockNumber();

// 체인의 12345678번째 블록 정보 반환
web3.eth.getBlock(12345678).then(console.log);

// 주소의 balance(잔고) 반환
await web3.eth.getBalance("_address");

// 해당 주소의 거래 정보 확인
await web3.eth.getTransaction("_tx address");

// 12345678 block의 2번째(0번째부터 시작) 거래 정보
await web3.eth.getTransactionFromBlock(12345678, 1);

// 계좌 생성 : 지갑주소, 개인키 자동 생성
web3.eth.accounts.create();

// 입력한 개인키로 계좌 생성
web3.eth.accounts.privateKeyToAccount("_private key");

// 앞에 0x붙여주기
var privateKey = "0x_privatekey";
var account = web3.eth.accounts.privateKeyToAccount(privateKey);
var account2 = "0x_address";

// 변수 account를 지갑에 등록
web3.eth.accounts.wallet.add(account);

// 돈 보내기, account -> account2로 0.01 만큼 보내기
await web3.eth.sendTransaction({
  from: account.address,
  to: account2,
  gas: "21000",
  value: "10000000000000000",
});

// Contract의 Bytecode값 반환
await web3.eth.getCode("_contract address");

// 해당 컨트랙트의 n번째 슬롯에 있는 값 확인
// ex) '0x78797a0000000000000000000000000000000000000000000000000000000006' 값이 반환되면
// 맨 앞에는 저장된 값 표시(78797a = 'xyz'), 맨 뒤에는 저장된 값 표시한 16진수 개수 표시(7,8,7,9,7,a로 6개 => 즉 저장된 값은 3자리구나('xyz') 알 수 있음)
await web3.eth.getStorageAt("_contract address", 0); // 슬롯의 0번째에 있는 변수 값 16진수로 반환
await web3.eth.getStorageAt("_contract address", 1);
await web3.eth.getStorageAt("_contract address", 2);
/* 블록체인은 투명함. 즉 getStorageAt()으로 public이든 private든 값을 모두 볼 수 있음.
따라서 중요한 정보는 절대!절대!절대! 값을 저장하면 안됨 */

// -------------------------------------------------------------------------------------------------

/*
스마트 컨트랙트와 소통 = Remix와 멀어지기
*/

// ABI 정보를 담은 변수 abi를 선언
var abi = [
  /* contract ABI 여기에 넣기 */
];

// 컨트랙트 주소 담은 변수 c_address 선언
var c_address = "_contract address";

// 위에 입력한 정보 2개(abi, contract address)로 컨트랙트 정보 입력, contract 변수 선언
var contract = new web3.eth.Contract(abi, c_address);

// contract의 function 및 methodID 확인, contract명.methods
contract.methods;

// 돈이 안드는 함수 호출하기 : 함수명 뒤에 .call() 붙이기
await contract.methods.add(1, 2).call();

// 돈 드는 함수 호출하기1 : 거래 정보 -> 서명 정보 -> 함수 호출
// 거래 정보를 담은 변수 tx 선언
var tx = {
  from: account.address,
  to: c_address,
  gas: 300000,
  gasPrice: 3000000,
  data: contract.methods.setA(7).encodeABI(),
};

// 서명 정보를 담은 변수 signPromise 선언
var signPromise = web3.eth.accounts.signTransaction(tx, account.privateKey);

// 함수 호출 실행
signPromise.then((signedTx) => {
  var sentTx = web3.eth.sendSignedTransaction(
    signedTx.raw || signedTx.rawTransaction
  );
  sentTx.on("receipt", (receipt) => {
    console.log(receipt);
  });
});

// 돈 드는 함수 호출하기2 : 함수명 뒤에 .send({ }) 붙이기
await contract.methods
  .setA(7)
  .send({ from: account.address, gas: 300000, gasPrice: 3000000 });

// -------------------------------------------------------------------------------------------------

/* 
웹소켓 프로바이더 사용
WS(Web Socket) : 실시간 정보 얻고 싶을 때 사용
*/

var { Web3 } = require("web3");
var web3 = new Web3("wss://mainnet.infura.io/ws/v3/_API Key"); // https -> wss 로 바뀌고, 중간에 /ws/ 추가됨

// 새로 생성되는 블록 정보 실시간으로 받아오는 명령어
var subscription = await web3.eth.subscribe("newHeads");

subscription.on("data", async (blockhead) => {
  console.log("New block header: ", blockhead);
});
