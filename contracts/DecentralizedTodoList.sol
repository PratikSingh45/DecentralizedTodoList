// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DecentralizedTodoList {
    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
        address creator;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(uint id, string content, address creator);
    event TaskCompleted(uint id, bool completed);
    event TaskDeleted(uint id);

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false, msg.sender);
        emit TaskCreated(taskCount, _content, msg.sender);
    }

    function toggleCompleted(uint _id) public {
        Task storage task = tasks[_id];
        require(task.creator == msg.sender, "Only creator can update task.");
        task.completed = !task.completed;
        emit TaskCompleted(_id, task.completed);
    }

    function deleteTask(uint _id) public {
        require(tasks[_id].creator == msg.sender, "Only creator can delete task.");
        delete tasks[_id];
        emit TaskDeleted(_id);
    }
}
