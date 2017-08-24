function pop = initialize(pop, popsize, nobj, ncon,nreal, min_realvar, max_realvar)
diff = max_realvar(1,:) - min_realvar(1,:);
%original code
%pop(:,nobj+1:nobj+nreal) = repmat(min_realvar(1,:),popsize,1) + rand(popsize,nreal) .* repmat(diff,popsize,1);

% below is corrected by Ling Zhu
pop(:,nobj+ncon+1:nobj+ncon+nreal) = repmat(min_realvar(1,:),popsize,1) + rand(popsize,nreal) .* repmat(diff,popsize,1);