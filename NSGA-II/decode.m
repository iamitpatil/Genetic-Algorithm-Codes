function pop = decode(pop, pop_strings, nobj, ncon, nreal, nbin, popsize, nbits, min_binvar, max_binvar)

for i=1:popsize
    stop = 0;
    for j=1:nbin
        start = stop+1; stop = start + nbits(j) - 1;
        total = sum(pop_strings(i,start:stop) .* 2.^(nbits(j)-1 : -1: 0));
        pop(i,nobj+ncon+nreal+j) = min_binvar(j) + (max_binvar(j)-min_binvar(j)) / (2^nbits(j)-1) * total;
    end
end