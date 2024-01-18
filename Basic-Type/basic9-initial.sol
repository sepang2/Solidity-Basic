// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// type별 초기값 확인
contract initialization {
    uint public a; // 0
    string public b; // "" (빈값)
    bytes1 public c; // 0x00
    bytes2 public d; // 0x0000
    bytes public e; // 0x
    uint[] public f; // "" (빈값)
    uint[4] public g; // [0, 0, 0, 0]
    string[] public h; // "" (빈값)
    string[4] public i; // ["", "", "", ""]
    bytes1[] public j; // "" (빈값)
    bytes1[4] public k; // [0x00, 0x00, 0x00, 0x00]
    bool public l; // false
    bool[] public m; // "" (빈값)
    bool[4] public n; // [false, false, false, false]

    struct A {
        uint a;
        string b;
        bool c;
    }

    A public aa; // 0, "", false

    function getFHJM() public view returns (uint[] memory, string[] memory, bytes1[] memory, bool[] memory) {
        return (f, h, j, m);
    }

    function getGIKN()public view returns (uint[4] memory, string[4] memory, bytes1[4] memory, bool[4] memory) {
        return (g, i, k, n);
    }
}
