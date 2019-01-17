function cypherImage = encryptionMA(T,Q)
%ENCRYPTION_DECRYPTIONBX Summary of this function goes here
%   Detailed explanation goes here
[M,N,P] = size(T);
cypherImage = zeros(M,N,P);
cypherImage = uint8(cypherImage);
F = 256;
for j = 1: N
    for i = 1: M
            if i == 1 && j == 1
                T(i,j);
                T(M,N);
                Q(i,j);
                number = uint16(T(i,j)) + uint16(T(M,N)) + uint16(Q(i,j));
                numeroFinal = mod(number,F);
                cypherImage(i,j,:) = uint8(numeroFinal);
                %T(i,j)/F + T(M,N)/F + Q(i,j)/F
            elseif i == 1 && j ~= 1
                
                number2 = uint16(T(i,j)) + uint16(cypherImage(M,j-1)) + uint16(Q(i,j));
                numeroFinal2 = mod(number2,F);
                cypherImage(i,j,:) = uint8(numeroFinal2);
            else
                number3 = uint16(T(i,j)) + uint16(cypherImage(i-1,j)) + uint16(Q(i,j));
                numeroFinal3 = mod(number3,F);
                cypherImage(i,j,:) = uint8(numeroFinal3);
            end
    end
end
end

