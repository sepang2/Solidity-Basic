// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";

// 오류 종류에는 panic, error가 있음
contract EH1 {
    /*
    require 조건이 true여야 통과, error 메세지 전달 가능.
    오류는 error를 발생시킴.
    - Error occured: revert.
    - execution cost: 730
    */
    function REQUIRE(uint _n) public pure returns(uint) {
        require(_n > 10, "Nope");
        return _n;
    }

    /*
    revert는 조건이 필요 없음. 그냥 마주치면 멈추는 것. error 메세지 전달 가능.
    오류는 error를 발생시킴.
    - Error occured: revert.
    - execution cost: 689
    */
    function REVERT(uint _n) public pure returns(uint) {
        if(_n < 10) {
            revert("lower than 10");
        }

        return _n;
    }

    /*
    assert 조건이 true여야 통과, error 메세지 전달 불가, 대신 에러코드를 반환함.
    오류는 panic을 일으킴. (0으로 나누기, array 길이 넘기기 등)
    내부적 에러 용도로만 사용을 권장함.
    
    0.7.0 버전까지는 가스비 환불 안하는 단점이 있었음.
    - Error occured: invalid opcode.
    - execution cost: 2978796

    0.8.0 버전부터는 가스비 환불해주는 것으로 업데이트 됨.
    - Error occured: revert.
    - execution cost: 451
    */
    function ASSERT(uint _n) public pure returns(uint) {
        assert(_n < 10);
        return _n;
    }
}

// 0으로 나누는 panic의 decoded output: 35408467139433450592217433187231851964531694900788300625387963629091585785856
// array 갈아 관련 panic의 decoded output: 35408467139433450592217433187231851964531694900788300625387963629091585785856
// require의 decoded output: 3963877391197344453575983046348115674221700746820753546331534351508065746944
contract PANIC {
    uint[] public numbers;

    function pushNumber(uint _n) public {
        numbers.push(_n);
    }

    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n];
    }

    function divide(uint _a, uint _b) public pure returns(uint) {
        require(_a >= 10);
        return _a / _b;
    }
}

// try-catch example
contract EH2 {
    function div(uint _a, uint _b) public pure returns(uint) {
        return _a / _b;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(uint) {
        try this.div(_a, _b) {
            return div(_a, _b);
        } catch {
            return 2;
        }
    }
}

// try-catch example 2
contract EH3 {
    function div(uint _a, uint _b) public pure returns(uint) {
        return _a / _b;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(uint) {
        try this.div(_a, _b) {
            return div(_a, _b);
        } catch Panic(uint _errorcode) {
            return _errorcode;
        } catch {
            return 2;
        }
    }
}

// try-catch example 3
contract EH4 {
    function div(uint _a, uint _b) public pure returns(uint) {
        require( _a != 10, "should not be ten");
        return _a / _b;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(uint) {
        try this.div(_a, _b) {
            return div(_a, _b);
        } catch Panic(uint _errorcode) {
            return _errorcode;
        } catch {
            return 2;
        }
    }
}

contract EH4_2 {
    function div(uint _a, uint _b) public pure returns(uint) {
        uint c = _a / _b;
        require( _a != 10, "should not be ten");
        return c;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(uint) {
        try this.div(_a, _b) {
            return div(_a, _b);
        } catch Panic(uint _errorcode) {
            return _errorcode;
        } catch {
            return 2;
        }
    }
}

// try-catch example 4
contract EH5 {
    function div(uint _a, uint _b) public pure returns(uint) {
        require( _a != 10, "should not be ten");
        assert(_a != 12);
        return _a / _b;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(string memory) {
        try this.div(_a, _b) {
            return Strings.toString(div(_a, _b));
        } catch Panic(uint _errorcode) {
            return Strings.toString(_errorcode);
        } catch Error(string memory _reason) {
            return _reason;
        } catch {
            return "last catch";
        }
    }
}

contract EH6 {
    uint public a;
    uint public b;
    uint public c;

    function numbers(uint _a, uint _b, uint _c) public {
        require(_a != 10, "should not be ten");
        assert(_b != 8);
        (a, b, c) = (_a, _b, _c);
    }

    // try-catch를 사용하는 이유 : error 상황에서도 바로 끝내지 않고 디테일하게 에러를 다루기 위해 사용.
    // ex) 아래처럼 panic이 발생해도 a, c 값은 변경, error가 발생해도 b, c 값은 변경
    function trycatch(uint _a, uint _b, uint _c) public returns(string memory) {
        // 함수가 실행이 되기만 하면 try로 들어감. 실행이 되지 않으면 catch로 들어감.
        try this.numbers(_a, _b, _c) {
            return ("done");
        } catch Panic(uint _errorcode) {
            (a, c) = (_a, _c);
            return Strings.toString(_errorcode);
        } catch Error(string memory _reason) {
            (b, c) = (_b, _c);
            return _reason;
        } catch {
            return "last catch";
        }
    }
}