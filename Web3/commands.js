// ws(Web Socket) : 실시간 정보 얻고 싶을 때 사용
var { Web3 } = require("web3");
var web3 = new Web3("wss://mainnet.infura.io/ws/v3/apikey"); // https -> ws 로 바꾸고, 중간에 /ws/ 추가

var subscription = await web3.eth.subscribe("newHeads");

subscription.on("data", async (blockhead) => {
  console.log("New block header: ", blockhead);
});
