function cypherImage = encryptionMA(T,Q)
%ENCRYPTIONMA Summary of this function goes here
%   Detailed explanation goes here
[M,N,P] = size(T);
cypherImage = zeros(M,N,P);
cypherImage = uint8(cypherImage);
for j = 1: N
    for i = 1: M
            if i == 1 && j == 1
                cypherImage(i,j,:) = mod(T(i,j,:) + T(M,N,:) + Q(i,j), 255);
            elseif i == 1 && j ~= 1
                cypherImage(i,j,:) = mod(T(i,j,:) + cypherImage(M,j-1,:) + Q(i,j), 255);
            else
                cypherImage(i,j,:) = mod(T(i,j,:) + cypherImage(i-1,j) + Q(i,j), 255);
            end
    end
end
end

