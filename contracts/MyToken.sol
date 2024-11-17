pragma solidity ^0.8.0;

contract Mytoken {
    //トークンの名前の定義
    string public name = "Mytoken";

    //トークンの単位を定義
    string public symbol = "MYT";

    //Tokenの最大の供給量を定義
    uint256 public totalSupply = 1000000;

    //このコントラクトのオーナーを定義
    address public owner;

    //トークンの所有者のアドレスと所有量を管理
    mapping(address => uint256) balances;

    
    //イベントを定義
    event Transfer(address indexed_from, address indexed _to, uint256 _value);



    constructor(){
        balances[msg.sender]=totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, uint256 amount) external {

        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;

        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }

    function balancesDf(address account) external view returns (uint256) {
        return balances[account];
    }

}