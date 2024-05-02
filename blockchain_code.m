% Create a blockchain instance
blockchain = Blockchain();

% Register and authenticate a transaction
blockchain.authenticate_transaction("Alice", "Bob", 10, -66688);

% Mine a block
blockchain.mine_block();
