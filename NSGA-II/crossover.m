function [child1, child2, child1_strings, child2_strings, nrealcross, nbincross] = ...
        crossover(parent1, parent2, child1, child2, parent1_strings, parent2_strings,...
        child1_strings, child2_strings, pcross_real, pcross_bin, nbincross, nrealcross, nobj, nreal, ...
        ncon, eta_c, min_realvar, max_realvar, nbin, nbits)


if (nreal ~= 0)
    [child1, child2, nrealcross] = ...
        realcross(parent1, parent2, child1, child2, pcross_real, nrealcross, min_realvar, max_realvar, nobj, nreal, ncon, eta_c);
    %     parent1 = child1; % BU KISMI IYI DUSUN: "MIXED-INTEGER PROBLEMI"
    %     parent2 = child2;
end
if (nbin ~= 0)
    [child1_strings, child2_strings, nbincross] = bincross(parent1_strings, parent2_strings, child1_strings, child2_strings, ...
        pcross_bin, nbincross, nbits, nbin);
end

function [child1, child2, nrealcross] = ...
    realcross(parent1, parent2, child1, child2, pcross_real, nrealcross, min_realvar, max_realvar, nobj, nreal, ncon, eta_c)
% Routine for real variable SBX crossover
global EPS
if (rand <= pcross_real)
    nrealcross = nrealcross+1;
    for i=1:nreal
        if (rand <= 0.5)
            if (abs(parent1(1,nobj+ncon+i)-parent2(1,nobj+ncon+i)) > EPS)
                if (parent1(1,nobj+ncon+i) < parent2(1,nobj+ncon+i))
                    y1 = parent1(1,nobj+ncon+i);
                    y2 = parent2(1,nobj+ncon+i);
                else
                    y1 = parent2(1,nobj+ncon+i);
                    y2 = parent1(1,nobj+ncon+i);
                end
                yl = min_realvar(i);
                yu = max_realvar(i);
                random_select = rand;
                beta = 1.0 + (2.0*(y1-yl)/(y2-y1));
                alpha = 2.0 - beta^(-(eta_c+1.0));
                if (random_select <= (1.0/alpha))
                    betaq = (random_select*alpha)^(1.0/(eta_c+1.0));
                else
                    betaq = (1.0/(2.0-random_select*alpha))^(1.0/(eta_c+1.0));
                end
                c1 = 0.5*((y1+y2)-betaq*(y2-y1));
                beta = 1.0 + (2.0*(yu-y2)/(y2-y1));
                alpha = 2.0 - beta^(-(eta_c+1.0));
                if (random_select <= (1.0/alpha))
                    betaq = (random_select*alpha)^(1.0/(eta_c+1.0));
                else
                    betaq = (1.0/(2.0-random_select*alpha))^(1.0/(eta_c+1.0));
                end
                c2 = 0.5*((y1+y2)+betaq*(y2-y1));
                if (c1 < yl)
                    c1 = yl;
                end
                if (c2 < yl)
                    c2 = yl;
                end
                if (c1 > yu)
                    c1 = yu;
                end
                if (c2 > yu)
                    c2 = yu;
                end
                if (rand <= 0.5)
                    child1(1,nobj+ncon+i) = c2;
                    child2(1,nobj+ncon+i) = c1;
                else
                    child1(1,nobj+ncon+i) = c1;
                    child2(1,nobj+ncon+i) = c2;
                end
            else
                child1(1,nobj+ncon+i) = parent1(1,nobj+ncon+i);
                child2(1,nobj+ncon+i) = parent2(1,nobj+ncon+i);
            end
        else
            child1(1,nobj+ncon+i) = parent1(1,nobj+ncon+i);
            child2(1,nobj+ncon+i) = parent2(1,nobj+ncon+i);
        end
    end
else
    child1(1,nobj+ncon+1:nobj+ncon+nreal) = parent1(1,nobj+ncon+1:nobj+ncon+nreal);
    child2(1,nobj+ncon+1:nobj+ncon+nreal) = parent2(1,nobj+ncon+1:nobj+ncon+nreal);
end

function [child1_strings, child2_strings, nbincross] = bincross(parent1_strings, parent2_strings, ...
    child1_strings, child2_strings, pcross_bin, nbincross, nbits, nbin)
% Routine for two point binary crossover
count = 0;
for i=1:nbin
    random_select = rand;
    if (random_select <= pcross_bin)
        nbincross = nbincross + 1;
        site1 = round(rand*nbits(i));
        if (site1 == nbits(i)), site1 = nbits(i)-1; elseif (site1 == 0), site1 = 1; end
        site2 = round(rand*nbits(i));
        if (site2 == nbits(i)), site2 = nbits(i)-1; elseif (site2 == 0), site2 = 1; end
        while (site1 == site2 || site2==0)
            site2 = round(rand*nbits(i));
        end
        if (site1 > site2)
            temp = site1;
            site1 = site2;
            site2 = temp;
        end
        child1_strings(1,count+1:count+nbits(i)) = parent1_strings(1,count+1:count+nbits(i));
        child2_strings(1,count+1:count+nbits(i)) = parent2_strings(1,count+1:count+nbits(i));
        child1_strings(1,count+site1 : count+site2) = parent2_strings(1,count+site1 : count+site2);
        child2_strings(1,count+site1 : count+site2) = parent1_strings(1,count+site1 : count+site2);
    else
        child1_strings(1,count+1:count+nbits(i)) = parent1_strings(1,count+1:count+nbits(i));
        child2_strings(1,count+1:count+nbits(i)) = parent2_strings(1,count+1:count+nbits(i));
    end
    count = count + nbits(i);
end






