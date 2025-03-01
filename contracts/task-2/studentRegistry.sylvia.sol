// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title Student Registry Contract
/// @notice This contract manages student registration, attendance, and interests.
contract StudentRegistry{
  enum Attendance { present, absent};

  struct Student{
    string name;
    Attendance attendance;
    string[] interests;
  }

//   Mapping to store students by address 
mapping(address => student)public students;

// the owner of the contract
address public owner;

// @notice Emitted when a student is registered
event StudentCreated(address indexed _studentAddress, string _name);

// @notice Emmitted when the student attendance is registered
event StudentAttendaance(address indexed _studentaddress, string _attendance);
// @notice Emmitted when a student interest is added
event StudentInterest(address indexed _studentaddress, string _interest);
// @notice Emmitted when a student interest is removed
event StudentRemoved(address indexed _studentaddress, string _interest);

// modifier to restict access to only the contract owner
modifier onlyOwner(){
    require(msg.sender == owner "Not the owner");
    _;
}

// to ensure that a student is registered
modifier studentExists(address _address){
    require(bytes(students[_address].name).length > 0; "Student does not exist!");
    _;
}

// @notice Ensures a student is not already registered
modifier StudentDoesNotExist(address _address){
    require(bytes(students[_address].name) .length == 0, "student already registered");
    _;
}

// @notice Constructor sets the deployer as a contract owner
Constructor(){
    owner = msg.sender;
} 

// @notice Register a new student with specified details
function registerStudent(string memory _name, Attendance _attendance, string[] memory _interests)
public studentDoesNotExist(msg.sender){
    require(bytes(_name).length > 0, "Name cannot be empty");
    students[msg.sender]= Student(_name,_attendance,_interests);
    emit StudentCreated(msg.sender, _name);
}

// @notice Registers a student with default attendance (Absent)

function registerNewStudent(string memory _name)public studentDoesNotExist(msg.sender){
   require(bytes (_name).length > 0, "Name cannot be empty") ;
   students[msg.sender] = Student(_name, Attendance.Absent, new string[](0));
   emit StudentCreated(msg.sender,_name);
}

// @notice Marks a student's attendance
function markAttendance(address _address, Attendance _attendance)
public studentExists(_address)
{
    students[_address].attendance = _attendance;
    emit AttendanceStatus(_address, _attendance);
}

// @notice Adds an interest to the student's profile

function addInterest(address _address, string memory _interest)public studentExists(_address){
    require(bytes(_interest).length > 0,"interest cannot be empty");
    require(students[_address].interests.length < 5, "Maximum interests reached");
    students[_address].interests.push(_interest);
    emit InterestAdded(_address, _interest);
}

// @notice Removes an interest from the student's profile 
function removeInterest(address _address, string memory _interest) public studentExists(_address){
   string[] storage interests = student[_address].interests;
   for(unit i =0; i < interests.length; i++){
    if (keccak256(abi.encodePacked(interests[1])) == keccak256(abi.encodePacked(_interest))){
        interests[i] = interests[interests.length - 1]
        interests.pop();
        emit InterestRemoved(_address, _interest);
        return;
    } 
   }
   revert("Interest not found")
    
 }

//  @notice Retrives the student's name

function getStudentName(address _address) public view studentExists (_address) returns(string memory){
    return students[_address].name;
}

// @notice retrives the student attendance
function getStudentAttendance (address _address) public view studentExists(address) returns ( Attendance){
    return students[address].attendance;
}

// @notice retrives the student interests
function getStudentInterests (address _address)public view studentExists(address) returns(string[] memory){
    return students[_address].interests;
}

// @notice transfer ownership of contract to a new owner
function transferOwnership(address _newOwner) public onlyOwner{
    require(_newOwner != address(0), "Invalid address");
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
}

}