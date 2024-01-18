// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 77. 위의 문제와 비슷합니다. 이번에는 openzeppelin의 패키지를 import 하세요.
// 힌트 : import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Q77 {
    function numToString(uint _n) public pure returns(string memory) {
        return Strings.toString(_n);
    }
}
