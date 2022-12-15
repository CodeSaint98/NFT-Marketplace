// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721Tradable.sol";

/**
 * @title RowdyNFT
 * RowdyNFT - a contract for non-fungible rowdies
 */
contract RowdyNFT is ERC721Tradable {
    uint256 public supply;
    uint256 public supplyTracker = 50;
    address public to;
    constructor(address _proxyRegistryAddress, address _to, uint256 _supply)
        ERC721Tradable("RowdyNFTs", "RNFT", _proxyRegistryAddress)
    {
        supply = _supply;
        to = _to;
        for (uint256 i = 0; i < 50; i++){
            mintTo(_to);
            supply++;
        }
    }

    function initializable(uint256 _amount) public{
        require(supplyTracker<=supply, "All NFTs minted");
        require(_amount<=10, "Can only mint 10 NFTs at a time");
        for (uint256 i = 0; i < _amount; i++){
            mintTo(to);
            supply++;
        }
    }

    function baseTokenURI() override public pure returns (string memory) {
        return "ipfs://QmQkbaZqN5Yn5hZAeg7CJDXXkKPAAfUnuLaBQ1MtQM2axk/";
    }

    function contractURI() public pure returns (string memory) {
        return "ipfs://QmWfTJibcvjJnneBWaNocZZKF5bgmRwxZkk1YZ9cEj3yW6/";
    }
}