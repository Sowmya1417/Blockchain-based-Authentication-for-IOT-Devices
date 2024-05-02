classdef BlockchainUser
    properties
        username
        privateKey
        publicKey
    end
    
    methods
        function obj = BlockchainUser(username)
            obj.username = username;
            obj.generateKeyPair();
        end
        
        function generateKeyPair(obj)
            obj.privateKey = randi([1, 1000]); % Replace with a secure key generation method
            obj.publicKey = obj.privateKey ^ 2; % Replace with a secure key derivation method
        end
    end
end

classdef Blockchain
    properties
        users = containers.Map; % Map to store users
    end
    
    methods
        function registerUser(obj, username)
            if ~isKey(obj.users, username)
                newUser = BlockchainUser(username);
                obj.users(username) = newUser;
                disp(['User ', username, ' registered successfully.']);
            else
                disp(['User ', username, ' already exists.']);
            end
        end
        
        function authenticateUser(obj, username, privateKey)
            if isKey(obj.users, username)
                user = obj.users(username);
                if user.privateKey == privateKey
                    disp(['User ', username, ' authenticated successfully.']);
                else
                    disp(['Authentication failed for user ', username, '.']);
                end
            else
                disp(['User ', username, ' does not exist.']);
            end
        end
    end
end
