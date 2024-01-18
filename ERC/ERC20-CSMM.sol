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

// 가격 비율은 '항상' 1:1 (x+y=k이기 때문)
// usdc <-> usdt 이런 경우에 사용하기도 함

// CSMM(Constant Sum Market Maker)
contract CSMM is ERC20("AB_LP_Token2", "ABLP2") {
    ERC20 public token_a;
    ERC20 public token_b;

    constructor(address _a, address _b) {
        token_a = ERC20(_a);
        token_b = ERC20(_b);
    }

    function balanceOfAB() public view returns(uint, uint) {
        return (token_a.balanceOf(address(this)), token_b.balanceOf(address(this)));
    }

    function provideInitialLiquidity() public {
        token_a.transferFrom(tx.origin, address(this), 1000);
        token_b.transferFrom(tx.origin, address(this), 1250);

        _mint(msg.sender, 2000);
    }

    /*
    원래는 1:1로 제공하지만, 아래는 업그레이드 버전으로.
    풀에서의 토큰 비율을 최대한 1:1로 맞춰가는 방향으로 만들기 위해 역비율로 제공.
    ex) 풀이 현재 3:5 비율이라면 역비율인 5:3으로 유동성 제공.
    */
    function provideLiquidity(address _token, uint _n) public {
        (uint bal_a, uint bal_b) = balanceOfAB();
        uint mint_lp;

        if(_token == address(token_a)) {
            uint _m = _n * bal_a / bal_b;

            token_a.transferFrom(tx.origin, address(this), _n);
            token_b.transferFrom(tx.origin, address(this), _m);

            mint_lp = _n * totalSupply() / bal_a;
        } else {
            uint _m = _n * bal_b / bal_a;

            token_a.transferFrom(tx.origin, address(this), _m);
            token_b.transferFrom(tx.origin, address(this), _n);

            mint_lp = _n * totalSupply() / bal_b;
        }

        _mint(msg.sender, mint_lp);
    }

    function withdrawLiquidity(uint _lp) public {
        require(balanceOf(msg.sender) >= _lp, "nope");
        (uint bal_a, uint bal_b) = balanceOfAB();

        uint a_out = _lp * bal_a / totalSupply();
        uint b_out = _lp * bal_b / totalSupply();

        _burn(msg.sender, _lp);

        token_a.transfer(msg.sender, a_out);
        token_b.transfer(msg.sender, b_out);
    }

    /*
    가격 비율이 1:1이기 때문에 그냥 바로 같은 수량으로 바꿔주면 됨
    수식으로 봐도,
    out = bal_b - (k - (bal_a + amount). (k = bal_a + bal_b)이기 때문에 대입하면
        = amount
    */
    function swap(address _token, uint _amount) public {
        if(_token == address(token_a)) {
            token_a.transferFrom(tx.origin, address(this), _amount);
            token_b.transfer(msg.sender, _amount);
        } else {
            token_b.transferFrom(tx.origin, address(this), _amount);
            token_a.transfer(msg.sender, _amount);
        }
    }
}