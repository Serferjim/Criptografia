function decypherImage = decryptionMA(cypherImage,Q,S)
%ENCRYPTION_DECRYPTIONBX Summary of this function goes here
%   Detailed explanation goes here
[M,N,P] = size(cypherImage);
T = zeros (M,N,P);
T = uint8(T);
decypherImage = zeros(M,N,P);
decypherImage = uint8(decypherImage);
F = 256;
for j = N:-1:1
    for i = M:-1:1
            if i == 1 && j == 1
                number = int16(cypherImage(i,j,:)) - int16(T(M,N,:)) - int16(Q(i,j));
                numeroFinal = mod(number,F);
                T(i,j,:) = uint8(numeroFinal);
            elseif i == 1 && j ~= 1
                 number2 = int16(cypherImage(i,j,:)) - int16(cypherImage(M,j-1,:)) - int16(Q(i,j));
                 numeroFinal2 = mod(number2,F);
                T(i,j,:) = uint8(numeroFinal2);
            else
                number3 = int16(cypherImage(i,j,:)) - int16(cypherImage(i-1,j,:)) - int16(Q(i,j));
                numeroFinal3 = mod(number3,F);
                T(i,j,:) = uint8(numeroFinal3);
            end
    end
end

for j=1:N
    for i=1:M
            m = i;
            n = S(i,j);
            r = mod(m + S(1,j) -1 ,M) + 1;
            c = S(r,j);
            decypherImage(r,c,:) = T(m,n,:);
    end
end
decypherImage = uint8(decypherImage);
save('decypherImage.mat','decypherImage');
figure, image(decypherImage);
end