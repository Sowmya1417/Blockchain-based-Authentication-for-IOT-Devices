classdef Blockchain
    properties
        chain
        current_transactions
    end
    
    methods
        function obj = Blockchain()
            obj.chain = struct('index', 1, 'timestamp', now, 'transactions', [], 'previous_hash', '1');
            obj.current_transactions = [];
        end
        
        function register_transaction(obj, sender, recipient, amount)
            % Register a new transaction into the list of transactions
            obj.current_transactions = struct('sender', sender, 'recipient', recipient, 'amount', amount);
            disp('Registered successfully');
        end
        
        function mine_block(obj)
            % Creates a new block and adds it to the chain
            previous_hash = obj.hash_block(obj.chain(end));
            new_block = struct('index', numel(obj.chain) + 1, ...
                               'timestamp', now, ...
                               'transactions', obj.current_transactions, ...
                               'previous_hash', previous_hash);
            obj.chain = [obj.chain, new_block];
            obj.current_transactions = [];
            disp('Block mined successfully');
        end
        
        function hash = hash_block(obj, block)
            % Convert the block structure to a JSON string
            json_str = jsonencode(block);
            % Generate a SHA-256 hash for the JSON string
            hash = string(hash('SHA-256', json_str));
        end
        
        function authenticate_transaction(obj, sender, recipient, amount, port)
    % Dummy authentication mechanism
    if sender == "Alice" && recipient == "Bob" &&  port<=9999
        disp('Authenticated successfully');
        obj.register_transaction(sender, recipient, amount);
    else
        disp('Authentication failed: Unauthorized sender, recipient, or port number');
    end
end

    end
end
