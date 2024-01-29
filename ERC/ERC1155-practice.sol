// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract MyToken is ERC1155, Ownable {
    string public _URI;
    constructor() ERC1155("") Ownable(msg.sender) {}

    function setURI(string memory newuri) public onlyOwner {
        _URI = newuri;
    }

    function mintToken(uint _tokenId, uint _amount) public {
        _mint(msg.sender, _tokenId, _amount, "");
    }

    function mintBatchToken(uint[] memory _tokenId, uint[] memory _amount) public {
        _mintBatch(msg.sender, _tokenId, _amount, "");
    }

    function uri(uint _tokenId) public override view returns(string memory) {
        return string(abi.encodePacked(_URI, '/', Strings.toString(_tokenId), '.json'));
    }

}
