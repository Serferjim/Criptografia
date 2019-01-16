function cypherImage = encryptionBX(T,Q)
%ENCRYPTIONBX Summary of this function goes here
%   Detailed explanation goes here
[M,N,P] = size(T);
cypherImage = zeros(M,N,P);
cypherImage = uint8(cypherImage);
for j = 1: N
    for i = 1: M
            if i == 1 && j == 1
                temp1 = bitxor(T(i,j,:),T(M,N,:), 'uint8');
                cypherImage(i,j,:) = bitxor(temp1, Q(i,j), 'uint8');
            elseif i == 1 && j ~= 1
                temp1 = bitxor(T(i,j,:),cypherImage(M,j-1,:), 'uint8');
                cypherImage(i,j,:) = bitxor(temp1,Q(i,j), 'uint8');
            else
                temp1 = bitxor(T(i,j,:),cypherImage(i-1,j,:), 'uint8');
                cypherImage(i,j,:) = bitxor(temp1,Q(i,j), 'uint8');
            end
    end
end
end

