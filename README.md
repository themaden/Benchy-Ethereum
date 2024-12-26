Benchy: Ethereum Network Dashboard and Benchmarking Tool

Benchy is a tool designed to launch, monitor, and benchmark Ethereum networks. It simplifies network management, provides detailed insights, and facilitates performance evaluation for Ethereum nodes.

Features

1. Launch and Monitor Private Ethereum Networks

Deploys a private Ethereum network with the benchy launch-network command.

Supports launching nodes either directly or within containers.

Configures a network of five nodes: Alice, Bob, Cassandra, Driss, and Elena.

Validators: Alice, Bob, and Cassandra.

Consensus Mechanism: Clique.

Clients Used: Geth and Nethermind.

Nodes are launched in the background, and the command returns immediately.

2. Node Information

Using the benchy infos command, display the following details for each node in the terminal or on a webpage:

Latest block.

List of connected peers.

Number of transactions in the mempool.

CPU and memory usage.

Ethereum address and balance.

3. Transaction Scenarios

Simulate various transaction scenarios using the benchy scenario X command:

Initialization: Run the network for a few minutes to allow validators to accumulate ETH.

Scenario 1: Alice sends 0.1 ETH to Bob every 10 seconds.

Scenario 2: Cassandra deploys an ERC20 contract with 3000 tokens named BY. She transfers 1000 tokens each to Driss and Elena.

Scenario 3: Cassandra sends 1 ETH to Driss and immediately attempts to cancel it by sending another transaction with a higher fee to Elena.

Provide execution feedback, including updated balances and status of transactions.

4. Simulate Temporary Node Failures

The benchy temporary-failure X command:

Randomly stops node X for 40 seconds.

Restarts the node automatically after the downtime.

5. Optional Features

Continuous execution of commands with the -u [time] option, where time is the interval in seconds (default: 60 seconds).

Connect a node to a public Ethereum testnet.

benchy infos displays information for the connected testnet node.

benchy scenario simulates scenarios using testnet addresses.

Installation

Prerequisites

Docker (if running nodes in containers).

Ethereum clients: Geth and Nethermind.

Python 3.8+ for the benchy tool.

Steps

Clone the repository:

git clone https://github.com/yourusername/benchy.git
cd benchy

Install dependencies:

pip install -r requirements.txt

Ensure Docker and Ethereum clients are properly installed and configured.

Usage

Launch the Network

benchy launch-network

Display Node Information

benchy infos

Run Scenarios

benchy scenario 1

benchy scenario 2

benchy scenario 3

Simulate Temporary Failures

benchy temporary-failure Cassandra

Continuous Monitoring

benchy infos -u 30

Connect to Testnet

benchy connect-testnet

Development

Project Structure

benchy/

network/: Network configuration and management.

monitor/: Node monitoring tools.

scenarios/: Scenario implementations.

cli.py: Command-line interface.

Contributions

We welcome contributions! Please submit a pull request or open an issue to report bugs or suggest new features.

License

This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments

Special thanks to the Ethereum community and developers of Geth and Nethermind for their powerful tools and documentation.



```shell
$ forge --help
$ anvil --help
$ cast --help
```
