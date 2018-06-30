function [ min, max, MaxCord, MinCord ] = MinMax( AnsMat )
%Input the array of averages and returns min and max average and their row
%and collem
%   For row and col, first value is for Max and second value is for Min
MaxCord = zeros(1, 2);
MinCord = zeros(1, 2);
currValMax = 0;
currValMin = 2;
    for at = 1:18
        for ct = 1:18
            if currValMax < AnsMat(ct, at)
               currValMax = AnsMat(ct, at);
               MaxCord(1, 2) = ct;
               MaxCord(1, 1) = at;
            end
            if currValMin > AnsMat(ct, at)
                currValMin = AnsMat(ct, at);
                MinCord(1, 2) = ct;
                MinCord(1, 1) = at;
            end    
        end  
    end
    min = currValMin;
    max = currValMax;
end

