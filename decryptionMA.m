function cypherImage = decryptionMA(cypherImage,Q,S)
%DECRYPTIONMA Summary of this function goes here
%   Detailed explanation goes here
[M,N,P] = size(cypherImage);
T = zeros (M,N,P);
T = uint8(T);
decypherImage = zeros(M,N,P);
tic;
for j = N:-1:1
    for i = M:-1:1
            if i == 1 && j == 1
                T(i,j,:) = mod(cypherImage(i,j,:) - T(M,N,:) - Q(i,j), 255);
            elseif i == 1 && j ~= 1
                T(i,j,:) = mod(cypherImage(i,j,:) - cypherImage(M,j-i,:) - Q(i,j), 255);
            else
                T(i,j,:) = mod(cypherImage(i,j,:) - cypherImage(i-1,j,:) - Q(i,j), 255);
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
toc;
decypherImage = uint8(decypherImage);
save('decypherImage.mat','decypherImage');
figure, image(decypherImage);
end