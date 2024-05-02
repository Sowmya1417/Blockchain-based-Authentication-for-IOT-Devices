% Define the parameters of the elliptic curve (SECP256R1)
p = hex2dec('FFFFF'); % prime field
a = hex2dec('FFFF') - 3; % coefficient a
b = hex2dec('5AC6'); % coefficient b
Gx = hex2dec('6B1'); % x coordinate of base point
Gy = hex2dec('4FE34'); % y coordinate of base point
n = hex2dec('FFFF'); % order of base point

% Generate a random private key
privateKey = randi([1, n-1]); % random integer between 1 and n-1

% Compute the corresponding public key (point multiplication)
P = double_and_add(Gx, Gy, privateKey, a, p); % Double-and-add algorithm
disp(['Private Key: ' num2str(privateKey)]);
disp(['Public Key (x, y): (' num2str(P(1)) ', ' num2str(P(2)) ')']);

% Double-and-add algorithm for point multiplication
function Q = double_and_add(Gx, Gy, k, a, p)
    bits = dec2bin(k); % Convert k to binary
    Qx = Gx;
    Qy = Gy;
    for i = 2:length(bits)
        Qx = mod(Qx^2 - 2*Qx*Qy^2 + a*Qx*Qy, p);
        Qy = mod(2*Qx*Qy, p);
        if bits(i) == '1'
            Qx = mod(Qx*Gx - Qy*Gy, p);
            Qy = mod(Qx*Gy + Qy*Gx, p);
        end
    end
    Q = [Qx, Qy];
end
