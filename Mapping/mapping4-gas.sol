// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

// 가스비 비교
contract MAPPING {
    struct Student1 {
        // string name;
        uint number;
        uint score;
        string home_address;
    }

    struct Student2 {
        string name;
        uint number;
        uint score;
        string home_address;
    }

    mapping(string => Student1) s1;
    mapping(string => Student2) s2;

    function setStudent1(string memory _name, Student1 memory _s1) public {
        s1[_name] = _s1;
    }

    function setStudent2(string memory _name, Student2 memory _s2) public {
        s2[_name] = _s2;
    }
}

// s1 : 92143, 69771
// s2 : 116059, 93219
// 결론 : 3개짜리가 더 싸다. 최적화하면서 가스비 줄이는 것이 관건.