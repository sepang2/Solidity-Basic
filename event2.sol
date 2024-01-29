// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract EVENT_EMIT {
    event ADD(string add, uint result);
    event SUB(string sub, uint result);
    event MUL(string mul, uint result);
    event DIV(string div, uint result);

    function add (uint _a, uint _b) public returns(uint _c) {
        _c = _a + _b;
        emit ADD("Plus", _c);
    }

    function sub(uint _a, uint _b) public returns(uint _c) {
        _c = _a - _b;
        emit SUB("Minus", _c);
    }

    function mul(uint _a, uint _b) public returns(uint _c) {
        _c = _a * _b;
        emit MUL("Times", _c);
    }

    function div(uint _a, uint _b) public returns(uint _c) {
        _c = _a / _b;
        emit DIV("Divided", _c);
    }
}


// Filter
/*
contract.events.index_1({filter: {_num: 10}}).on('data', funciton(event){console.log(event)})
_num이 10인 거래만 표시
returnValue에 10n으로 표시됨
*/
contract indexed_event_1 {
    event index_1(uint indexed _num, string _name);

    function event_1(uint _n, string memory _s) public {
        emit index_1(_n, _s);
    }
}

/*
contract.events.index_2({filter: {_name: 'abc'}}).on('data', funciton(event){console.log(event)})
_name이 'abc'인 거래만 표시
returnValue에 'abc'의 keccak256한 값('0x~~')으로 표시됨
*/
contract indexed_event_2 {
    event index_2(uint _num, string indexed _name);

    function event_2(uint _n, string memory _s) public {
        emit index_2(_n, _s);
    }
}

/*
contract.events.index_3({filter: {_num: 12345, _name: 'abcde'}}).on('data', funciton(event){console.log(event)})
_num이 12345이거나 _name이 'abcde'인 거래만 표시. 즉, 둘 중 하나에만 걸려도 표시
returnValue에 인풋값 모두 표시됨(필터에 안걸린 값도 표시됨)
*/
contract indexed_event_3 {
    event index_3(uint indexed _num, string indexed _name);

    function event_3(uint _n, string memory _s) public {
        emit index_3(_n, _s);
    }
}