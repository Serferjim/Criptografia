function entropia = entropia(inputImageMAT)
%ENTROPIA Summary of this function goes here
%   Detailed explanation goes here
imageLoad = load(inputImageMAT);
imageLoad = cell2mat(struct2cell(imageLoad));
h = imhist(imageLoad);

p = 0;
for i = 1 : 256
    p = p +h(i);
end
entropia  = 0;

for i = 1 : 256
    entropia = entropia +(h(i)/(p))*log2(h(i)/(p));
end
entropia = -entropia;
end

