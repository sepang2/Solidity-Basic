// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token_A is ERC20("A_Token", "A") {
    constructor(uint256 _n) {
        _mint(msg.sender, _n);
    }

    function mint(address _addr, uint256 _n) public {
        _mint(_addr, _n);
    }
}

contract Token_B is ERC20("B_Token", "B") {
    constructor(uint256 _n) {
        _mint(msg.sender, _n);
    }

    function mint(address _addr, uint256 _n) public {
        _mint(_addr, _n);
    }
}

// CPMM(Constant Product Market Maker)
contract CPMM is ERC20("AB_LP_Token", "ABLP") {
    ERC20 public token_a;
    ERC20 public token_b;

    address owner;

    constructor(address _a, address _b) {
        token_a = ERC20(_a);
        token_b = ERC20(_b);

        owner = msg.sender;
    }

    // Liquidity Pool에 있는 A, B 토큰의 개수를 반환하는 함수
    function balanceOfAB() public view returns (uint256, uint256) {
        return (
            token_a.balanceOf(address(this)),
            token_b.balanceOf(address(this))
        );
    }

    // 유동성 최초 공급
    function provideInitialLiquidity() public {
        token_a.transferFrom(tx.origin, address(this), 1000);
        token_b.transferFrom(tx.origin, address(this), 3000);

        _mint(msg.sender, 10000);
    }

    // 유동성 공급
    function provideLiquidity(address _token, uint256 _n) public {
        (uint256 bal_a, uint256 bal_b) = balanceOfAB();
        uint mint_lp;

        // 토큰 개수 맞추기
        if (_token == address(token_a)) {
            uint256 _m = (_n * bal_b) / bal_a;

            token_a.transferFrom(tx.origin, address(this), _n);
            token_b.transferFrom(tx.origin, address(this), _m);

            // LP 토큰 지급하기
            mint_lp = (_n * totalSupply()) / bal_a;
        } else {
            uint256 _m = (_n * bal_a) / bal_b;

            token_a.transferFrom(tx.origin, address(this), _m);
            token_b.transferFrom(tx.origin, address(this), _n);

            mint_lp = (_n * totalSupply()) / bal_b;
        }

        _mint(msg.sender, mint_lp);
    }

    // 유동성 회수
    function withdrawLiquidity(uint _lp) public {
        require(balanceOf(msg.sender) >= _lp, "nope");
        (uint bal_a, uint bal_b) = balanceOfAB();

        // 소각(_lp 만큼)
        _burn(msg.sender, _lp);

        uint a_out = (_lp * bal_a) / totalSupply();
        uint b_out = (_lp * bal_b) / totalSupply();

        token_a.transfer(msg.sender, a_out);
        token_b.transfer(msg.sender, b_out);
    }

    // swap 함수
    function swap(address _token, uint _amount) public {
        (uint bal_a, uint bal_b) = balanceOfAB();
        // x * y = k
        uint k = bal_a * bal_b;

        if(_token == address(token_a)) {
            uint out = bal_b - k / (bal_a + _amount);
            token_a.transferFrom(tx.origin, address(this), _amount);
            token_b.transfer(msg.sender, out);
        } else {
            uint out = bal_a - k / (bal_b + _amount);
            token_b.transferFrom(tx.origin, address(this), _amount);
            token_a.transfer(msg.sender, out);
        }
    }
}

/*
1. A token에서 balance of 확인
2. B token에서도 확인
3. A,B에서 CPMM 에게 approve
4. CPMM에서 provide initial liquidity
5. CPMM에서 내 지갑 balanceOf 확인
*/

/*
1. 2번지갑으로 이동
2. A,B 각각 10000개씩 민트
3. A,B에서 CPMM에게 approve
4. CPMM에서 A 500개 provide liquidity
5. CPMM에서 2번 지갑 balance of 확인
6. CPMM에서 balanceOfAB 확인
*/

