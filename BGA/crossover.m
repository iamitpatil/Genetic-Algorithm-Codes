function offsprings = crossover(parents, probCrossover)


if rand>probCrossover
    offsprings = parents;
    return;
end

[parents_row, parents_col] = size(parents);

for i = 1:parents_col
    
    bitLength(i) = length(parents{1,i});
 
end

totalbitLength = sum(bitLength);

%determining the crossover point%
cpoint = ceil(totalbitLength*rand());

%combining parents%    
parent1 = strcat(parents{1,:});
parent2 = strcat(parents{2,:});

%performing crossover%
offspring1 = strcat(parent1(1:cpoint),parent2(cpoint+1:totalbitLength));
offspring2 = strcat(parent2(1:cpoint),parent1(cpoint+1:totalbitLength));


%breaking apart offsprings after crossover%

offsprings{1,1} = offspring1(1:bitLength(1));
offsprings{2,1} = offspring2(1:bitLength(1));

for j = 2:parents_col
    
    offsprings{1,j} = offspring1(sum(bitLength(1:j-1)+1):sum(bitLength(1:j)));
    offsprings{2,j} = offspring2(sum(bitLength(1:j-1)+1):sum(bitLength(1:j)));
    
end
