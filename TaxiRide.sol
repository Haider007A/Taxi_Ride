//SPDX-License-identifier: GPL-3.0

pragma solidity ^0.7.5;

contract TaxiRide {
    
    enum RideStatus {Requested, Completed} 
Struct Ride {
        address passenger;
        string destination;
        uint256 timestamp;
        RideStatus status;
}
 mapping(uint256=> Ride) public rides;
 uint256 public rideCount;
    event RideRequested(uint256 rideId, address passenger, string destination, uint256 timestamp);
    event RideCompleted(uint256 rideId, uint256 timestamp);

     function requestRide(string memory _destination) external {
        rideCount++;
        Ride storage newRide = rides[rideCount];
        newRide.passenger = msg.sender;
        newRide.destination = _destination;
        newRide.timestamp = block.timestamp;

        emit RideRequested(rideCount, msg.sender, _destination, block.timestamp);
}

uint public balanceReceived;
  function receivedMoney() public payable {
        balanceReceived += msg.value;
  }

  function withdrawMoneyTo(address payable _to) public{
        _to.transfer(getBalance());
  }
}