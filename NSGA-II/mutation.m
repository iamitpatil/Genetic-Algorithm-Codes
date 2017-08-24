% Function to perform mutation in a population
function [pop, pop_strings, nbinmut, nrealmut] = mutation(pop, pop_strings, popsize, nreal, pmut_real, min_realvar, ...
    max_realvar, eta_m, nobj, ncon, nbin, nbits, pmut_bin, nbinmut, nrealmut)
for i=1:popsize
    
    if (nreal ~= 0)
        [pop(i,:), nrealmut] = real_mutate_ind(pop(i,:), nobj, ncon, nreal, pmut_real, min_realvar, max_realvar, eta_m, nrealmut);
    end
    
    if (nbin ~= 0)
        [pop_strings(i,:), nbinmut] = bin_mutate_ind(pop_strings(i,:), nbin, nbits, pmut_bin, nbinmut);
    end

end

% Routine for binary mutation of an individual
function [ind, nbinmut] = bin_mutate_ind(ind, nbin, nbits, pmut_bin, nbinmut)
count=0;% corrected by Ling Zhu
for j=1:nbin
%     count = 0; %original
    for k=1:nbits(j)
        prob = rand;
        if (prob <= pmut_bin)
            if (ind(1,count+k) == 0)
                ind(1,count+k) = 1;
            else
                ind(1,count+k) = 0;
            end
            nbinmut = nbinmut+1;
        end
%         count = nbits(j); %original
    end
    count = count + nbits(j);% corrected by Ling Zhu
end

% Routine for real mutation of an individual
function [ind, nrealmut] = real_mutate_ind(ind, nobj, ncon, nreal, pmut_real, min_realvar, max_realvar, eta_m, nrealmut)
for j=1:nreal
    if (rand <= pmut_real)
        y = ind(1,nobj+ncon+j);
        yl = min_realvar(j);
        yu = max_realvar(j);
        delta1 = (y-yl)/(yu-yl);
        delta2 = (yu-y)/(yu-yl);
        random_select = rand;
        mut_pow = 1.0/(eta_m+1.0);
        if (random_select <= 0.5)
            xy = 1.0-delta1;
            val = 2.0*random_select+(1.0-2.0*random_select)*xy^(eta_m+1.0);
            deltaq = val^mut_pow-1.0;
        else
            xy = 1.0-delta2;
            val = 2.0*(1-random_select)+2.0*(random_select-0.5)*xy^(eta_m+1.0);
            deltaq = 1.0-val^(mut_pow);
        end
        y = y+deltaq*(yu-yl);
        if (y < yl)
            y = yl;
        end
        if (y > yu)
            y = yu;
        end
        ind(1,nobj+ncon+j) = y;
        nrealmut = nrealmut+1;
    end
end



    

