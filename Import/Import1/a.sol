// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// 같은 폴더의 파일 import
import './b.sol';
import './c.sol';

// 같은 폴더의 하위 폴더 파일 import
import './D/d.sol';

// 다른 폴더의 파일 import
import '../Import2/e.sol';

/*
전체 구성

Import1
|___a.sol
|___b.sol
|___c.sol
|___D
	  |__d.sol

Import2
|____e.sol 
*/

contract A {
    BB b = new BB();
    CCC c = new CCC();
    CCC2 c2 = new CCC2();
    DDDD d = new DDDD();
    EEE e = new EEE();

    function add(uint _a, uint _b) public view returns(uint) {
        return b.add(_a, _b);
    }

    function add(uint _a, uint _b, uint _c) public view returns(uint) {
        return b.add(_a, _b, _c);
    }

    function multiply(uint _a, uint _b) public view returns(uint) {
        return c.multiply(_a, _b);
    }

    function multiply(uint _a, uint _b, uint _c) public view returns(uint) {
        return c.multiply(_a, _b, _c);
    }

    function power(uint _a, uint _b) public view returns(uint) {
        return c2.power(_a, _b);
    }

    function sub(uint _a, uint _b) public view returns(uint) {
        return d.sub(_a, _b);
    }

    function div(uint _a, uint _b) public view returns(uint) {
        return e.div(_a, _b);
    }
}