function resUACI = UACI(imagen1, imagen2)
%UACI Summary of this function goes here
%   Detailed explanation goes here
resUACI = 0;
imageLoad1 = load(imagen1);
imageLoad1 = cell2mat(struct2cell(imageLoad1));
imageLoad1 = double(imageLoad1);

imageLoad2 = load(imagen2);
imageLoad2 = cell2mat(struct2cell(imageLoad2));
imageLoad2 = double(imageLoad2);

[M,N,~] = size(imageLoad1);

for i = 1 : M
    for j = 1 : N
        resUACI = resUACI + abs(imageLoad1(i,j,:) - imageLoad2(i,j,:));
    end
end

resUACI = resUACI*100/(255*M*N);
end

