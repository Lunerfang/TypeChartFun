fileIdMain = fopen('typechar.txt', 'r');
formSpec = '%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\n';
Size = [18 18];
mainArry = fscanf(fileIdMain, formSpec, Size);
mainArry = mainArry';
fclose(fileIdMain);
it = 18;
% currCol, nextCol = zeros(18, 1);
ansArry = zeros(18);
%a = 18*18;
%weakArry = zeros(19 a);


for ct = 1:it
    currCol = mainArry(:, ct); 
    for at = 1:it
        nextCol = mainArry(:,at);
        if ct == at
            ansArry(at,ct) = AveDam(currCol);
        else
            DualCol = currCol .* nextCol;
            an = AveDam(DualCol);
            ansArry(at,ct) = an;
        end
    end   
end

[min, max, maxCord, minCord] = MinMax(ansArry);
order = 'Normal, Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground, Flying, Psychic, Bug, Rock, Ghost, Dragon, Dark, Steel, Fairy\n';
fileIdSave = fopen('typeChartAve.txt', 'w');
% fprintf(fileIdSave, order);
fprintf(fileIdSave, formSpec, ansArry);
fclose(fileIdSave);

fileIdAns = fopen('TypeChartAns.txt', 'w');
fprintf(fileIdAns, 'Max       Cord     Min     Cord\n');
total = [max , maxCord(1,1), maxCord(1,2), min, minCord(1,1), minCord(1,2)];
fprintf(fileIdAns, '%f  (%d,%d)  %f  (%d,%d)', total);
fclose(fileIdAns);

currCol = mainArry(:, maxCord(1,1));
nextCol = mainArry(:, maxCord(1,2));
WorstCol = currCol.*nextCol;

currCol = mainArry(:, minCord(1,1));
nextCol = mainArry(:, minCord(1,2));
BestCol = currCol.*nextCol;

