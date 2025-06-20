const { ethers } = require("hardhat");

async function main() {
  const TodoContract = await ethers.getContractFactory("DecentralizedTodoList");
  const todo = await TodoContract.deploy();

  await todo.deployed();

  console.log(`DecentralizedTodoList deployed to: ${todo.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
