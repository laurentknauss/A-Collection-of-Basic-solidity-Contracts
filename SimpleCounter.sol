
// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;


/// @title Counter Contract
/// @notice This contract allows incrementing , setting and multiplying a stored number by 10.
/// @dev Demonstrates simple state manipulation and a view function in solidity. 

contract Counter {
     /// @notice Stores the current value of the counter
     uint256 public number;

     /// @notice Sets the stored number to a new value.
     /// @param NewNumber The new number to set the number to .
    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

     /// @notice Increments the stored number  by 1 and returns the new value
     /// @return The incremented value of the store number . 
    function increment() public returns (uint256) {
        number++;
        return number;
    }

     /// @notice Multiplies the stored number by 10 and returns the result.
     /// @dev This function is read-only and does not modify the state
      function  multiplyBy10() public view returns(uint256) { 
        return number*10; 
    }
}


