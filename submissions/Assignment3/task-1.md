#Task 1 
# Count Smart Contract  

This Solidity contract implements a **simple numerical counter** with functions to:  

- **Increase the Counter**: Increments the counter by 1, ensuring it does not exceed the maximum `uint256` value.  
- **Decrease the Counter**: Decrements the counter by 1, preventing it from going below zero.  
- **Reset the Counter**: Resets the counter back to zero.  
- **Retrieve the Counter Value**: Allows users to check the current counter value.  
- **Get Maximum `uint256` Value**: Returns the maximum possible value for a `uint256`.  

Each action emits an **Updated** event, tracking changes in the counter along with the address that triggered the update.

Here's a link to [task 1](../../contracts/task-1/)