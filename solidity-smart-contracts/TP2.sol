pragma solidity ^0.4.0;


//Fidelity points and local currency

contract TP2 {

    //User who has fidelity points
    struct User{
        uint fidelityPoints;
    }
    
    //Mapping of users allowed to have fidelity points
    mapping(address => User) users;
    
    //get the number of fidelityPoints a user has
    function balanceOf(address _owner) constant returns (uint256 balance){
        balance = users[_owner].fidelityPoints;
    }
    
    //Give the user a certain number of fidelityPoints
    function transfer(address _to, uint256 _value) returns (bool success){
        
        //Verify if the value is not negative
        if(_value > 0){
            users[_to].fidelityPoints += _value;
            success = true;
        }
        else{
            success = false;
        }
    }
    
    //Remove a certain number of fidelity points from a user
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success){
        
        //Verify if the value is not negative
        if(_value > 0){
            users[_from].fidelityPoints -= _value;
            success = true;
        }
        else{
            success = false;
        }
    }
}