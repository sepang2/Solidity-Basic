// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
안건을 올리고 이에 대한 찬성과 반대를 할 수 있는 기능을 구현하세요. 
안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.(구조체)
안건들을 모아놓은 자료구조도 구현하세요. 

사용자는 자신의 이름과 주소, 자신이 만든 안건 그리고 자신이 투표한 안건과 어떻게 투표했는지(찬/반)에 대한 정보[string => bool]로 이루어져 있습니다.(구조체)

* 사용자 등록 기능 - 사용자를 등록하는 기능
* 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
* 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
* 제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환 // 밑의 심화 문제 풀었다면 상태도 반환)
* 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
-------------------------------------------------------------------------------------------------
* 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 전체의 70% 그리고 투표자의 66% 이상이 찬성해야 통과로 변경, 둘 중 하나라도 만족못하면 기각
*/

contract Test7_240109 {
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

    // 안건은 번호, 제목, 내용, 제안자(address) 그리고 찬성자 수와 반대자 수로 이루어져 있습니다.(구조체)
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

    // 안건들을 모아놓은 자료구조도 구현하세요.
    // Proposal[] proposals;
    mapping(string => Proposal) public proposals;
    uint public count;
    uint public userCount;

    // 사용자는 자신의 이름과 주소, 자신이 만든 안건 그리고 자신이 투표한 안건과
    // 어떻게 투표했는지(찬/반)에 대한 정보[string => bool]로 이루어져 있습니다.(구조체)
    struct User {
        string name;
        address addr;
        Proposal[] p;
        mapping(string => votingStatus) voted;
    }

    // User[] users;
    mapping(address => User) public users;

    // * 사용자 등록 기능 - 사용자를 등록하는 기능
    function registUser(string calldata _name) public {
        (users[msg.sender].name, users[msg.sender].addr) = (_name, msg.sender);
        userCount++;
    }

    // * 투표하는 기능 - 특정 안건에 대하여 투표하는 기능, 안건은 제목으로 검색, 이미 투표한 건에 대해서는 재투표 불가능
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

    // * 안건 제안 기능 - 자신이 원하는 안건을 제안하는 기능
    function propose(string calldata _title, string calldata _content) public {
        proposals[_title] = Proposal(++count, _title, _content, msg.sender, 0, 0, proposalStatus.ongoing, block.timestamp);
        users[msg.sender].p.push(Proposal(++count, _title, _content, msg.sender, 0, 0, proposalStatus.ongoing, block.timestamp));
    }

    // * 제안한 안건 확인 기능 - 자신이 제안한 안건에 대한 현재 진행 상황 확인기능 - (번호, 제목, 내용, 찬반 반환 // 밑의 심화 문제 풀었다면 상태도 반환)
    function getMyProposal() public view returns(Proposal[] memory) {
        return users[msg.sender].p;
    }

    // * 전체 안건 확인 기능 - 제목으로 안건을 검색하면 번호, 제목, 내용, 제안자, 찬반 수 모두를 반환하는 기능
    function getProposal(string calldata _title) public view returns(Proposal memory) {
        return proposals[_title];
    }

    // * 안건 진행 과정 - 투표 진행중, 통과, 기각 상태를 구별하여 알려주고 전체의 70% 그리고 투표자의 66% 이상이 찬성해야 통과로 변경, 둘 중 하나라도 만족못하면 기각
    function setProposalStatus(string calldata _title) public {
        require(block.timestamp >= proposals[_title].time + 10 minutes);
        if((proposals[_title].pros + proposals[_title].cons) * 100 >= userCount * 70 && proposals[_title].pros * 100 >= (proposals[_title].pros + proposals[_title].cons) * 66) {
            proposals[_title].status = proposalStatus.passed;
        } else {
            proposals[_title].status = proposalStatus.failed;
        }
    }
}