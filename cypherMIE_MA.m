function cypherMIE_MA(imageToCypher)
%CYPHERMIE_MA Summary of this function goes here
%   Detailed explanation goes here
tic;
imageData = imread(imageToCypher);
imageData = uint8(imageData);
%Dimensions for randImage
H = size(imageData,1);
W = size(imageData,2);
%Random vectors
R = randi(255,size(imageData,2));
K = randi(255,size(imageData,1) + 2);
R = uint8(R);
K = uint8(K);
%Image with random values surrounding
P = zeros(H+2, W+2, 3);
P = uint8(P);
for line=1: size(P,1)
    for column=1: size(P,2)
        for z=1: size(P,3)
            if (line==1 && column ==1)
                P(line,column,z) = K(1,1);
            elseif (line==1 && column ~= 1 && column ~= W+2)
                P(line,column,z) = R(line,column-1);
            elseif (line==1 && column == W+2)
                P(line,column,z) = K(1,2);
            elseif (line ~=1 && line < H && column ==1)
                P(line,column,z)= K(line,1);
            elseif (line ~=1 && line < H && column == W+2)
                P(line,column,z) = K(line,2);
            elseif (line == H && column ==1)
                P(line,column,z) = K(H,1);
            elseif (line == H+1 && column == 1)
                P(line,column,z) = K(H+1,1);
            elseif (line == H+2 && column == 1)
                P(line,column,z) = K(H+2,1);
            elseif (line == H && column == W + 2)
                P(line,column,z) = K(H,2);
            elseif(line == H+1 && column == W + 2)
                P(line,column,z) = K(H+1,2);
            elseif (line == H+2 && column == W + 2)
                P(line,column,z) = K(H+2,2);
            elseif (line == H+2 && column ~= 1 && column ~= W +2)
                P(line,column,z) = R(2,column -1);
            else
                P(line,column,z) = imageData(line-1,column-1,z);
            end
        end
    end
end

%High speed scrambling
%Dimensions of randImage
[M,N,K] = size(P);
A = rand(M);
B = rand(N);
sortedA = sort(A);
sortedB = sort(B);

I = zeros(size(A,1),1);
J = zeros(size(B,1),1);
for a=1 : size(sortedA)
    i = find(A == sortedA(a));
    I(a) = i;
end

for b=1 : size(sortedB)
    j = find(B == sortedB(b));
    J(b) = j;
end

S = zeros(M, N);
T = zeros(M, N, K);
for i = 1: M
    for j =1: N
            m = mod(j-I(i)-1,N)+1;
            S(i,m) = J(j);
    end
end
for j=1: N
    for i=1: M
            r = i;
            c = S(i,j);
            m = mod(r - S(1,j)-1, M) + 1;
            n = S(m,j);
            T(m,n,:) = P(r,c,:);
    end
end
T = uint8(T);
save('S.mat', 'S' );
%Q generation and write in file
Q = randi(255,M,N,K);
Q = uint8(Q);
save('Q.mat', 'Q' );
cypherImage = encryptionMA(T,Q);
cypherImage = uint8(cypherImage);
toc;
figure, image(cypherImage);
save('cypherImage.mat','cypherImage');

end