function UACIexpected()
%UACIEXPECTED Summary of this function goes here
%   Detailed explanation goes here
res = 0;

sumatorio = 0;

for i = 1 : 255
   sumatorio  = sumatorio + i*(i+1); 
end

sumatorio = sumatorio/255;

res = 1/(256*256) *sumatorio

end

