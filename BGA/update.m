function [newBinPop, newFitness] = update1(binPop, offsprings, fitness, ...
    fitnessOffsprings)


binPop = [binPop; offsprings];
fitness = [fitness; fitnessOffsprings];
[newFitness, I] = sort(fitness, 'descend');
newBinPop = binPop(I,:);
newFitness = newFitness(1:end-length(fitnessOffsprings));
newBinPop = newBinPop(1:end-length(fitnessOffsprings),:);