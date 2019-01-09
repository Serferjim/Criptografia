function decypherImage = decryptionBX(cypherImage,T,Q,S)
%ENCRYPTION_DECRYPTIONBX Summary of this function goes here
%   Detailed explanation goes here
[M,N,P] = size(cypherImage);
decypherImage = zeros(M,N,P);

for j = N:-1:1
    for i = M:-1:1
            if i == 1 && j == 1
                temp1 = bitxor(cypherImage(i,j,:),T(M,N,:), 'uint8');
                T(i,j,:) = bitxor(temp1,Q(i,j), 'uint8');
            elseif i == 1 && j ~= 1
                temp1 = bitxor(cypherImage(i,j,:),cypherImage(M,j-1,:), 'uint8');
                T(i,j,:) = bitxor(temp1,Q(i,j), 'uint8');
            else
                temp1 = bitxor(cypherImage(i,j,:),cypherImage(i-1,j,:), 'uint8');
                T(i,j,:) = bitxor(temp1,Q(i,j), 'uint8');
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