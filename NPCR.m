function NPCR = NPCR(inputImageMAT, inputImageMAT2)

imageLoad = load(inputImageMAT);
imageLoad = cell2mat(struct2cell(imageLoad));
imageLoad2 = load(inputImageMAT2);
imageLoad2 = cell2mat(struct2cell(imageLoad2));

H = size(imageLoad,1);
W = size(imageLoad,2);

pixels = H*W;

A = zeros(W,H);

for i = 1 : W
    for j = 1 : H 
    A(i,j) = imageLoad(i,j) == imageLoad2(i,j);
    end
end

sumaA = sum(A(:));

NPCR = (sumaA/pixels)*100

end