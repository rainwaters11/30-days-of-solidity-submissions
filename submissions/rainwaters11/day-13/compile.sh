#!/usr/bin/env bash
npx --yes -p solc solcjs --bin --abi --output-dir build "$(dirname "$0")/WhitelistedTokenSale.sol" && echo "Compiled OK → build/"
