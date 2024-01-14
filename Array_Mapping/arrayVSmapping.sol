// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// array와 mapping의 gas비교
contract ARRAY_MAPPING {
    struct A {
        string name;
        string _address;
    }

    A[] a_array;

    mapping(uint => A) a_mapping;
    uint idx; // v2
    uint idx_2 = 0; // v3

    function pushA_1(A memory _a) public {
        a_array.push(_a);
    }

    function pushA_2(uint _n, A memory _a) public {
        a_mapping[_n] = _a;
        // idx++; // v2
        idx_2++; // v3
    }
}

// 기본적으로 arr가 더 비쌈 (transaction cost, execution cost)
// array gas : (91709, 69665) / (74609, 52565) / (74609, 52565)
// mapping gas : (69885, 47713) / (69885, 47713) / (69885, 47713)

/*
v2 - mapping에서 전체 값 반환하기 위해 상태변수 idx 선언한 경우. 상태변수 가격이 비싼걸 알 수 있음.
상태변수 값 받을 준비하느라 첫 실행 가스비가 많이 비쌈.
// array gas : (91709, 69665) / (74609, 52565) / (74609, 52565)
// mapping gas : (92151, 69967) / (75051, 52867) / (75051, 52867)
*/

/*
v3 - 상태변수 0으로 초기화해서 값 받을 준비 안시키면 가스비가 줄까? => 아님 똑같음
// mapping gas : (92151, 69967) / (75051, 52867) / (75051, 52867)
*/

/*
평소 : arr > mapping
배포 : arr < mapping + idx
      arr < mapping
*/

// deployment gas : 374991, 298353
contract ARRAY_MAPPING2 {
    struct A {
        string name;
        string _address;
    }

    A[] a_array;

    function pushA_1(A memory _a) public {
        a_array.push(_a);
    }
}

// deployment gas : 413272, 334372
contract ARRAY_MAPPING3 {
    struct A {
        string name;
        string _address;
    }

    mapping(uint => A) a_mapping;
    uint idx;

    function pushA_2(uint _n, A memory _a) public {
        a_mapping[_n] = _a;
        idx++;
    }
}

// deployment gas : 383567, 306541
contract ARRAY_MAPPING3_2 {
    struct A {
        string name;
        string _address;
    }

    mapping(uint => A) a_mapping;

    function pushA_2(uint _n, A memory _a) public {
        a_mapping[_n] = _a;
    }
}
