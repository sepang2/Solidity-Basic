// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract BLOCK {
    uint time;

    // 현재 시간
    function getTime() public view returns (uint) {
        return block.timestamp;
    }

    function getTime2() public view returns (uint) {
        return block.timestamp + 100;
    }

    // +10, +600
    function getTime3() public view returns (uint, uint) {
        return (block.timestamp + 10 seconds, block.timestamp + 10 minutes);
    }

    // +3600, +86400, +604800
    function getTime4() public view returns (uint, uint, uint) {
        return (
            block.timestamp + 1 hours,
            block.timestamp + 1 days,
            block.timestamp + 1 weeks
        );
    }

    function lockTime() public {
        time = block.timestamp;
    }

    function A() public view returns (bool) {
        if (block.timestamp <= time + 20) {
            return true;
        } else {
            return false;
        }
    }
}

contract BLCOK2 {
    // 블록 개수 반환 (block의 length)
    function getBlockNumber() public view returns (uint) {
        return block.number;
    }

    function getBlockHash(uint _n) public view returns (bytes32) {
        return blockhash(_n - 1);
    }

    function getLastBlockHash() public view returns (bytes32) {
        return blockhash(getBlockNumber() - 1);
    }
}
