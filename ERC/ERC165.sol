pragma solidity ^0.8.20;

import {IERC165} from "./IERC165.sol";

// ERC-165: Standard Interface Detection
// method ID(=selector)를 확인해서 표준을 잘 지켰는지 확인하는 ERC.
abstract contract ERC165 is IERC165 {
    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}
