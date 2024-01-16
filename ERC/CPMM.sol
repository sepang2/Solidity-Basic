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

contract CPMM is ERC20("AB_LP_Token", "ABLP") {
    ERC20 public token_a;
    ERC20 public token_b;

    address owner;

    constructor(address _a, address _b) {
        token_a = ERC20(_a);
        token_b = ERC20(_b);

        owner = msg.sender;
    }

    function balanceOfAB() public view returns (uint256, uint256) {
        return (
            token_a.balanceOf(address(this)),
            token_b.balanceOf(address(this))
        );
    }

    // 유동성 공급
    function provideLiquidity(address _token, uint256 _n) public {
        (uint256 bal_a, uint256 bal_b) = balanceOfAB();
        uint mint_lp;

        // 토큰 개수 맞추기
        if (_token == address(token_a)) {
            uint256 _m = _n * bal_b / bal_a;

            token_a.transferFrom(tx.origin, address(this), _n);
            token_b.transferFrom(tx.origin, address(this), _m);

            // LP 토큰 지급하기
            mint_lp = _n * totalSupply() / bal_a;
        } else {
            uint256 _m = _n * bal_a / bal_b;

            token_a.transferFrom(tx.origin, address(this), _m);
            token_b.transferFrom(tx.origin, address(this), _n);

            mint_lp = _n * totalSupply() / bal_b;
        }

        _mint(msg.sender, mint_lp);
    }

    // 유동성 회수
    function withdrawLiquidity(uint _lp) public {
        require(balanceOf(msg.sender) >= _lp, "nope");
        (uint bal_a, uint bal_b) = balanceOfAB();

        // 소각(_lp 만큼)
        _burn(msg.sender, _lp);

        uint a_out = _lp * bal_a / totalSupply();
        uint b_out = _lp * bal_b / totalSupply();

        token_a.transfer(msg.sender, a_out);
        token_b.transfer(msg.sender, b_out);
    }
}
