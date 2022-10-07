### Testing

`forge test` - run all tests
`forge test -vvvv` - run all tests with debugger
`forge test -vvvv --match-test testCannotDecrementLargerNumbers` - ru single test with debugger

### Deploy contract

`anvil` - run locally. can get private key here

`forge c src/Contract.sol:Contract --private-key PRIVATE_KEY --constructor-args ARGS` - deploy one contract with private key and pass the argument to contructor. Returns:
```t
Deployer: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 # Public Key
Deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3 # Address
Transaction hash: 0x2c7e0008f9dc65d1dbf43ccd917a41fec1513f7ff7f82b0165e4bd1ca3ef4964
```

### Interact with contract

ABI - Application binary interface. Like API but for contract
`forge inspect CONTRACT_NAME abi` - get contract ABI. Returns JSON

`cast call CONTRACT_ADDRESS "CONTRACT_METHOD()"` - call the contract, where `CONTRACT_ADDRESS` is a `Contract created` value from `anvil` launch return trace. State will not be changed.
Returns Hexadecimal number.
Example:

````t
cast call 0x5fbdb2315678afecb367f032d93f642f64180aa3 "getNum()"
````


`cast send CONTRACT_ADDRESS "CONTRACT_METHOD()" VALUE(Optional) --private-key PRIVATE_KEY` - will call the contract and change the blockchain with the user's private key.
Examples:
````t
cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 "increment()" --private-key 0x8b3a350cf5c34c9194ca85829a2df0ec3153be0318b5e2d3348e872092edffba
cast send 0x5fbdb2315678afecb367f032d93f642f64180aa3 "decrement(uint256)" 1 --private-key 0x8b3a350cf5c34c9194ca85829a2df0ec3153be0318b5e2d3348e872092edffba
````

### Deploy to testnet
Ropster testnet faucet - ETH testnet. URL: https://faucet.egorfine.com/
To get RPC_URL:
1) go to https://www.quicknode.com/
2) Create endpoint in Rqpster testnet
3) Grab HTTP Provider
Then deploy contract with Metamasks Private key in Ropster testnet and add `--rpc-url` with `RPC_URL` value

### Interact with contract on testnet
`cast call CONTRACT_ADDRESS "CONTRACT_METHOD()" --rpc-url RPC_URL` - where `CONTRACT_ADDRESS`is a `Deployed to`  value from contract deploy call.
`cast send CONTRACT_ADDRESS "CONTRACT_METHOD()" VALUE(Optional) --private-key PRIVATE_KEY --rpc-url RPC_URL` - to change state