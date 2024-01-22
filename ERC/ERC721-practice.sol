// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

// *** ERC721에서 tokenURI()가 가장 중요함!! ***
// tokenURI()를 거쳐야 우리가 볼 수 있는 이미지가 나오는 것
contract firstNFT is ERC721Enumerable {
    string public metaDataURI;

    constructor() ERC721("LikeLionNFT3", "L721-3") {}   

    function mintNFT(string memory _URI, uint _tokenId) public {
        metaDataURI = _URI;
        _mint(msg.sender, _tokenId);
    }

    function tokenURI(uint _tokenId) public view override returns (string memory){
        return string(abi.encodePacked(metaDataURI));
    }
    
}

contract MintNFT is ERC721Enumerable {
    string metadataURI;
    uint maxSupply;

    constructor (string memory _name,string memory _symbol,string memory _metadataURI,uint _maxSupply) ERC721 (_name,_symbol){
        metadataURI=_metadataURI;
        maxSupply=_maxSupply;
    }

    function mintNFT()public {
        require(totalSupply()<500,"no more Mint.");
        uint tokenId = totalSupply() + 1;
        _mint(msg.sender, tokenId);
    }

    function tokenURI(uint _tokenId) public view override returns (string memory){
        return string(abi.encodePacked(metadataURI,'/',Strings.toString(_tokenId),'.json'));
    }

}

contract Reveal is ERC721Enumerable {
    string public beforeURI;
    string public afterURI;
    bool public isRevealed;

    constructor(string memory _beforeURI, string memory _afterURI) ERC721("LikeLionReveal", "LLR-1") {
        beforeURI = _beforeURI;
        afterURI = _afterURI;
    }

    function mintNFT() public {
        uint tokenId = totalSupply() + 1;
        _mint(msg.sender, tokenId);
    }

    function setStatus(bool _b) public {
        isRevealed = _b;
    }

    function tokenURI(uint _tokenId) public view override returns(string memory) {
        if(isRevealed == false) {
            return string(abi.encodePacked(beforeURI));
        } else {
            return string(abi.encodePacked(afterURI));
        }
    }
}