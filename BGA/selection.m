function parents = selection(binPop,fitness)



%% Select parents by tournament selection
[binPop_row, binPop_col] = size(binPop);
randMembers1 = randi(binPop_row,2,1);
randMembers2 = randi(binPop_row,2,1);
if fitness(randMembers1(1)) >= fitness(randMembers1(2))
    parentIndex1 = randMembers1(1);
else
    parentIndex1 = randMembers1(2);
end
if fitness(randMembers2(1)) >= fitness(randMembers2(2))
    parentIndex2 = randMembers2(1);
else
    parentIndex2 = randMembers2(2);
end
parents = {binPop{parentIndex1,:}; binPop{parentIndex2,:}};

%% Select best parent and another parent randomly
%[binPop_row, binPop_col] = size(binPop);
%[maxFitness, I] = max(fitness);
%J = ceil(rand()*binPop_row);
%parents = {binPop{I,:}; binPop{J,:}};
