fileIdMain = fopen('typechar.txt', 'r');
formSpec = '%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n';
Size = [18 18];
mainArry = fscanf(fileIdMain, formSpec, Size);
mainArry = mainArry';
fclose(fileIdMain);
it = 18;
ansArry = zeros(20,(it^2));
a = 1;

for ct = 1:it
    currCol = mainArry(:,ct);
    for at = 1:it
        nextCol = mainArry(:,at);
        DualCol = currCol.*nextCol;
        ansArry(1, a) = ct;
        ansArry(2, a) = at; 
        if ct == at
            ansArry(3:20, a) = currCol;
        else
            ansArry(3:20, a) = DualCol;
        end
        a = a + 1;
    end
    
end

ansArry = ansArry';
[row, cols] = size(ansArry);
x = repmat('%f, ', 1, (row-1));
y = repmat('%d, ', 1, (cols-1));

fileIDSave = fopen('WeeknesArryAns.txt', 'w');
fprintf(fileIDSave,[x, '%f\n'], ansArry);
fclose(fileIDSave);

