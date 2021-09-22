// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;


/** CONTRACT on the blockchain */
contract TodoList {

    constructor() public {
        createTask("Task 1");
    }
    /** DATA on this contract */

    // taskCount: state variable, non negative unsigned int
    // these are like class variables
    // they represent the state of the application at the moment
    // public: solidity keyword exposes a getter
    uint public taskCount = 0;

    // define our own data structure
    // like defining a class
    struct Task {
        uint id;
        string content;
        bool completed;
    }

    // tasks: variable to store tasks
    // a map with having a uint as a key and task as a value
    mapping(uint => Task) public tasks;

    /** METHODS to deal with data on the contract*/

    // createTask: function to create a new task
    // memory: allot a string type memory for the _content variable
    // this memory is allotted at contract creation time
    // not using the keyword can produce unexpected results
    // source: https://stackoverflow.com/questions/33839154/in-ethereum-solidity-what-is-the-purpose-of-the-memory-keyword
    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }
}
