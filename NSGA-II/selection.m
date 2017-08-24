function [new_pop, new_pop_strings, nrealcross, nbincross] = selection(old_pop, old_pop_strings, pcross_real, pcross_bin, ...
    eta_c, nbincross, nrealcross, min_realvar, max_realvar, nbits, nobj, ncon, nreal, nbin)
% Routine for tournament selection, it creates a new_pop from old_pop by
% performing tournament selection and the crossover
popsize = size(old_pop, 1);
new_pop = zeros(size(old_pop));
if nreal ~= 0
%     new_pop = zeros(size(old_pop));
    if nbin == 0
        new_pop_strings = [];
    end
end
if nbin ~= 0
    new_pop_strings = zeros(size(old_pop_strings));
end

a1 = randperm(popsize);
a2 = randperm(popsize);
for i=1:4:popsize
    parent1 = tournament(old_pop(a1(i),:), old_pop(a1(i+1),:), nobj, ncon, nreal, nbin);
    parent2 = tournament(old_pop(a1(i+2),:), old_pop(a1(i+3),:), nobj, ncon, nreal, nbin);
    if nbin ~= 0
        [~, ~, new_pop_strings(i,:), new_pop_strings(i+1,:), nrealcross, nbincross] = ...
            crossover(parent1, parent2, [], [], old_pop_strings(i,:), old_pop_strings(i+1,:), ...
            new_pop_strings(i,:), new_pop_strings(i+1,:), pcross_real, pcross_bin, nbincross, nrealcross, nobj, nreal, ...
            ncon, eta_c, min_realvar, max_realvar, nbin, nbits);
    else
        [new_pop(i,:), new_pop(i+1,:), ~, ~, nrealcross, nbincross] = ...
            crossover(parent1, parent2, new_pop(i,:), new_pop(i+1,:), [], [], ...
            [], [], pcross_real, pcross_bin, nbincross, nrealcross, nobj, nreal, ...
            ncon, eta_c, min_realvar, max_realvar, nbin, nbits);
    end
    parent3 = tournament(old_pop(a2(i),:), old_pop(a2(i+1),:), nobj, ncon, nreal, nbin);
    parent4 = tournament(old_pop(a2(i+2),:), old_pop(a2(i+3),:), nobj, ncon, nreal, nbin);
    if nbin ~= 0
        [~, ~, new_pop_strings(i+2,:), new_pop_strings(i+3,:), nrealcross, nbincross] = ...
            crossover(parent3, parent4, [], [], old_pop_strings(i+2,:), old_pop_strings(i+3,:), ...
            new_pop_strings(i+2,:), new_pop_strings(i+3,:), pcross_real, pcross_bin, nbincross, nrealcross, nobj, nreal, ...
            ncon, eta_c, min_realvar, max_realvar, nbin, nbits);
    else
        [new_pop(i+2,:), new_pop(i+3,:), ~, ~, nrealcross, nbincross] = ...
            crossover(parent3, parent4, new_pop(i+2,:), new_pop(i+3,:), [], [], ...
            [], [], pcross_real, pcross_bin, nbincross, nrealcross, nobj, nreal, ...
            ncon, eta_c, min_realvar, max_realvar, nbin, nbits);
    end
end

function parent = tournament(ind1, ind2, nobj, ncon, nreal, nbin)
flag = check_dominance(ind1, ind2, nobj, ncon, nreal, nbin);
if (flag == 1)
    parent = ind1;
elseif (flag == -1)
    parent = ind2;
elseif (ind1(1,end) > ind2(1,end))
    parent = ind1;
elseif (ind2(1,end) > ind1(1,end))
    parent = ind2;
elseif (rand <= 0.5)
    parent = ind1;
else
    parent = ind2;
end



