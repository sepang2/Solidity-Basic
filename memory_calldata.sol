// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
memory는 값 저장되어 있는 주소에 가서 값 복사해서 들고오는 것이기 때문에 값 변경 가능.
calldata는 통째로 가져오는 것이기 때문에 값 변경 불가능.
gas비 : memory > calldata
output에는 calldata는 사용 불가능.
*/
contract Memory_Calldata {
    function Input(string memory _s) public pure returns (string memory) {
        return _s;
    }

    function Input2(string memory _s) public pure returns (string memory) {
        _s = "abcde";
        return _s;
    }

    function Input3(string calldata _s) public pure returns (string memory) {
        return _s;
    }

    // calldata로 input받기 때문에 input값 변경 불가능 -> 에러
    function Input4(string calldata _s) public pure returns (string memory) {
        // _s = "abcde"; // 에러
        return _s;
    }

    function Array1(
        uint256[] memory _nums
    ) public pure returns (uint256[] memory) {
        return _nums;
    }

    function Array2(
        uint256[] memory _nums
    ) public pure returns (uint256[] memory) {
        _nums[1] = 3;
        return _nums;
    }

    function Array3(
        uint256[] calldata _nums
    ) public pure returns (uint256[] memory) {
        return _nums;
    }

    // calldata로 input받기 때문에 input값 변경 불가능 -> 에러
    function Array4(
        uint256[] calldata _nums
    ) public pure returns (uint256[] memory) {
        // _nums[1] = 3; // 에러
        return _nums;
    }
}
