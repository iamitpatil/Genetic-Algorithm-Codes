function [maxFitness, eliteMemberDec] = produceEliteMember(binPop, fitness, minDim, maxDim, maximization)



xDecimal = decode(binPop,minDim,maxDim);
[maxFit, I] = max(fitness);
maxFitness = maximization * maxFit;
eliteMemberDec = xDecimal(I,:);