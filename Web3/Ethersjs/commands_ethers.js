// ethers.js commands in terminal
// ethers.js docs = https://docs.ethers.org/v5/

/*
1. 기본 환경 세팅
원하는 디렉토리에서 시작
npm init
npm install ethers
node
*/

var { ethers } = require("ethers");
ethers;

// ethers.js에서는 infura에서 기본 provider 제공
var provider_main = new ethers.InfuraProvider(); // 기본제공 메인넷
var provider_goerli = new ethers.InfuraProvider((network = "goerli")); // 기본제공 goerli
var provider_goerli2 = new ethers.InfuraProvider("goerli", "_API Key"); // infura 사이트에서 Active Endpoints가 아닌 API key

await provider_main.getBlockNumber();
await provider_goerli.getBlockNumber();
await provider_goerli.getBalance("_address");

// 돈 보내기
var privateKey = "_private key";
var signer = new ethers.Wallet(privateKey, provider_goerli2);
var account2 = "_account address";
var tx = { to: account2, value: 10000000000000000n }; // signer에서 account2로 0.01 보내기
var txReceipt = signer.sendTransaction(tx).then(console.log); // 아래 주석 참고
/* tx가 block에 올라가기 전에 정보를 가져와서 blockNumber, blockHash값을 못 가져옴. 
반대로 web3.js는 tx가 block에 올라가고 난 후에 정보를 가져오기 때문에 모든 정보가 다 보임.
따라서 tx 정보만 필요하다면 빠르게 가져올 수 있는 ethers.js 사용하는게 유리 */

await provider_goerli2.getCode("_contract address"); // Bytecode 반환
await provider_goerli2.getCode("_account address"); // '0x' 나오는게 정상. bytecode는 CA에만 있기 때문
await provider_goerli2.getStorage("_contract address", 1); // contract의 slot[1]에 저장된 값 16진수 형태로 반환
/* getStorage()로 visibility 상관 없이 모든 값을 볼 수 있기 때문에 절대! 중요한 정보 저장 X */

var abi = "_ABI";
var c_address = "_contract address";
var contract = new ethers.Contract(c_address, abi, signer);

// ethers.js에서는 web3.js와 다르게 call(), send() 필요없이 그냥 함수 쓰듯이 쓰면 됨
contract.interface.fragments; // contract의 함수들 표시
// ex) 아래는 web3-practice.sol의 Contract D를 가져왔을 때 예시
await contract.x();
await contract.setA("0x56"); // x값 0x56으로 바꾸기
