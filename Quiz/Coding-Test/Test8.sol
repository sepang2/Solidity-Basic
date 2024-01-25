// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

/*
숫자를 시분초로 변환하세요.
예) 100 -> 1분 40초, 600 -> 10분, 1000 -> 16분 40초, 5250 -> 1시간 27분 30초
*/

import "@openzeppelin/contracts/utils/Strings.sol";

contract Test8_240122 {
    function numToTime(uint _n) internal pure returns(uint, uint, uint) {
        return(_n / 3600, (_n % 3600) / 60, _n % 60);
        
        /* 아래는 제출한 것
        uint _hrs;
        uint _mins;
        uint _secs;

        for(uint i = 0; i < 3; i++) {
            if(_n >= 60 ** 2) {
                _hrs = _n / 60 ** 2;
                _n %= 60 ** 2;
            } else {
                _mins = _n / 60;
                _secs = _n % 60;
            }
        }

        return (_hrs, _mins, _secs);
        */
    }
    
    function getTime(uint _n) public pure returns(string memory) {
        (uint h, uint m, uint s) = numToTime(_n);
        return string(abi.encodePacked(Strings.toString(h), "hr ", Strings.toString(m), "min ", Strings.toString(s), unicode"초"));

        /* 아래는 제출한 것
        string[8] memory _time;
        (uint h, uint m, uint s) = numToTime(_n);
        _time[0] = Strings.toString(h);
        _time[1] = "hr";
        _time[2] = " ";
        _time[3] = Strings.toString(m);
        _time[4] = "min";
        _time[5] = " ";
        _time[6] = Strings.toString(s);
        _time[7] = unicode"초"; // 한글 넣는 법

        string memory _s;
        for(uint i = 0; i < _time.length; i++) {
            _s = string.concat(_s, _time[i]);
        }

        return _s;
        */
    }
}