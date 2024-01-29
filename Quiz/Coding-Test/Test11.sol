// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
각 은행은(은행 contract) 예치, 인출의 기능을 가지고 있고 국세청은(정부 contract) 모든 국민의 재산정보를 파악하고 있다. 

각 국민은 이름, 각 은행에 예치한 금액으로 이루어진 구조체이다. 

이 나라는 1인 1표가 아닌 납부한 세금만큼 투표권을 얻어가는 특이한 나라이다. 

특정 안건에 대해서 투표하는 기능도 구현하고 각 안건은 번호, 이름, 제목, 내용, 찬-반 비율, 상태로 구성되어 있다.
안건이 등록되면 등록, 투표중이면 투표, 5분 동안 투표를 진행하는데 찬-반 비율이 60%가 넘어가면 통과. 60% 가 안되었으면 기각이 된다. 

안건은 1이더 이상 세금을 납부한 사람만이 등록할 수 있고, 안건을 등록할 때마다 0.25 이더씩 깎인다. 세금 납부는 갖고 있는 총 금액의 2%를 실시한다.
(예: 100이더 보유 -> 2이더 납부 -> 안건 2개 등록 -> 1.5 납부로 취급)

Test11_240109
*/

contract Gov {
    struct People {
        string name;
        mapping(string => uint) deposit;
    }

    mapping(address => People) person;
    Bank B;
    Prop P;

    function registerPeople(string calldata _name) public {
        (person[msg.sender].name, person[msg.sender].deposit) = (_name, )
    }
    
}

contract Bank {
    function Deposit() public payable {}

    function Withdraw(uint _n) public {
        require(msg.sender.balance >= _n, "Not enough money");
        payable(msg.sender).transfer(_n);
    }

    function getBalance() public view returns(uint) {
        return tx.origin.balance;
    }
}

contract Prop {
    enum votingStatus {
        notVoted,
        pro,
        con
    }

    enum proposalStatus {
        ongoing,
        passed,
        failed
    }

    struct Proposal {
        uint256 num;
        string title;
        string content;
        address by;
        uint256 pros;
        uint256 cons;
        proposalStatus status;
        uint time;
    }

    mapping(string => Proposal) public proposals;
    uint public count;  

    function vote(string calldata _title, bool _vote) public {
        require(users[msg.sender].voted[_title] == votingStatus.notVoted, "Already voted proposal");

        if(_vote == true) {
            proposals[_title].pros++;
            users[msg.sender].voted[_title] = votingStatus.pro;
        } else {
            proposals[_title].cons++;
            users[msg.sender].voted[_title] = votingStatus.con;
        }
    }

    function propose(string calldata _title, string calldata _content) public {
        proposals[_title] = Proposal(++count, _title, _content, msg.sender, 0, 0, proposalStatus.ongoing, block.timestamp);
        users[msg.sender].p.push(Proposal(++count, _title, _content, msg.sender, 0, 0, proposalStatus.ongoing, block.timestamp));
    }

    function getProposal(string calldata _title) public view returns(Proposal memory) {
        return proposals[_title];
    }

    function setProposalStatus(string calldata _title) public {
        require(block.timestamp >= proposals[_title].time + 10 minutes);
        if((proposals[_title].pros + proposals[_title].cons) * 100 >= userCount * 70 && proposals[_title].pros * 100 >= (proposals[_title].pros + proposals[_title].cons) * 66) {
            proposals[_title].status = proposalStatus.passed;
        } else {
            proposals[_title].status = proposalStatus.failed;
        }
    }
}