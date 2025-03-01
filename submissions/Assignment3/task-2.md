#Task 2

# Student Registry Smart Contract  

This Solidity contract implements a **Student Registry System**, allowing users to register as students, track attendance, and manage their interests. The contract includes:  

- **Student Registration**: Users can register with a name, attendance status, and interests.  
- **Attendance Tracking**: Students’ attendance can be updated as "Present" or "Absent."  
- **Interest Management**: Students can add or remove interests, with a limit of five.  
- **Access Control**: Only the contract owner can perform specific actions.  
- **Event Logging**: Events are emitted for key actions like student creation, attendance updates, and interest modifications.  

The contract ensures security and data integrity using **modifiers** and **require statements** to validate inputs and restrict unauthorized access.

Here's a link to [task 2](../../contracts/task-2/)