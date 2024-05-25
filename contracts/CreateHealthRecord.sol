// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MedicalRecord {
    struct Record {
        string prescription;
        string followUp;
    }

    mapping(uint256 => Record) private records;
    uint256 private recordIdCounter;

    event RecordCreated(uint256 recordId, string prescription, string followUp);

    function createRecord(string memory _prescription, string memory _followUp) public {
        records[recordIdCounter] = Record(_prescription, _followUp);
        emit RecordCreated(recordIdCounter, _prescription, _followUp);
        recordIdCounter++;
    }

    function getRecord(uint256 _recordId) public view returns (string memory prescription, string memory followUp) {
        Record storage record = records[_recordId];
        return (record.prescription, record.followUp);
    }

    function getRecordCount() public view returns (uint256) {
        return recordIdCounter;
    }
}
