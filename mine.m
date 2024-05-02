function block = mine(index, prev_hash, timestamp, data)

NumZeros = 2; 
delay_time = 0.0003;

found = false;
for idx = 0:2^32
    nonce = uint32(idx);
    [hash, uint8_sha256] = bc.Blockchain.calculate_hash(index, prev_hash, timestamp, nonce, data);
    if uint8_sha256(1:NumZeros) == zeros(1,NumZeros, 'uint8')
        found = true;
        break;
    end
    pause(delay_time);
end
if found
    block = bc.Block(index, prev_hash, timestamp, data, nonce, hash);
else
    block = [];
end
