function [ AveDam ] = AveDam( currCol )
%takes the 18x1 matrix and gives the average of it's values
%   
    ave = 0;
    i = 18;
    for c = 1:i
        ave = ave + currCol(c,1);    
    end
   AveDam = ave/18;
end

