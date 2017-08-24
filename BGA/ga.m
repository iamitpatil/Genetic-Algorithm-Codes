

%%Bitlength is computed based on accuracy

clear all;
%
popSize = 100;
probCrossover = 0.9;
probMutation = 1.0/32.0; 
defaultAccuracy = 0.0001; % all var. assumes same accuracy
nGen = 200;
nDim = 2;
minDim = [0 0];
maxDim = [5 5];

maximization = -1; % for minimization problems
% maximization = 1;  % for maximization problems

accuracy = defaultAccuracy;
bitLength = log((maxDim - minDim)/accuracy + 1)/log(2.0);
bitLength = ceil(bitLength),

decPop = initialize(popSize, nDim, minDim, maxDim);
binPop = encode(decPop, minDim, maxDim, bitLength);

fitness = evaluate(binPop, minDim, maxDim, maximization);

for i=1:nGen
    
    parents = selection(binPop, fitness);
    
    offsprings = crossover(parents, probCrossover);

    offsprings = mutation(offsprings, probMutation);
    
    fitnessOffsprings = evaluate(offsprings, minDim, maxDim, maximization);
    
    [newBinPop, newFitness] = update1(binPop, offsprings, fitness, ...
        fitnessOffsprings);
    
    binPop = newBinPop;
    
    fitness = newFitness;
    
end

[optimalFitness, xOptimal] = produceEliteMember(binPop, fitness, minDim, ...
    maxDim, maximization)


