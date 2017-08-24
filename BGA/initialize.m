function decPopulation = initialize(popSize, nDim, minDim, maxDim)



decPopulation = repmat(minDim,popSize,1) + rand(popSize,nDim).*repmat(maxDim - minDim,popSize,1);
