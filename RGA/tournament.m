% Constraint TOURNAMENT SELECTION
%
function pop_sel = tournament(pop, k)
N = size(pop,1);

% TOURNAMENT-1
tour1 = randperm(N);
tour2 = randperm(N);
tour = [tour1, tour2];

% START THE COMPETITION
pop_sel = zeros(N, k); % Only the design variables of the selected members
ID = zeros(N,1);
count = 0;
for i=1:2:2*N
    fitness = pop(tour(i:i+1), k+1);
    cons_violation = pop(tour(i:i+1), k+2);

    if (cons_violation(1) == 0) && (cons_violation(2) == 0)
        % If both solutions are feasible: Select the one with the minimum fitness value
        min_member = find(fitness == min(fitness));
    elseif (cons_violation(1) ~= 0) && (cons_violation(2) == 0)
        % If 2nd solution is feasible and 1st solution is infeasible: Select 2nd solution
        min_member = 2;
    elseif (cons_violation(1) == 0) && (cons_violation(2) ~= 0)
        % If 1st solution is feasible and 2nd solution is infeasible: Select 1st solution
        min_member = 1;
    elseif (cons_violation(1) ~= 0) && (cons_violation(2) ~= 0)
        % If both solutions are infeasible: Select the one with the minimum constraint violation
        min_member = find(cons_violation == min(cons_violation));
    end
    count = count + 1;
    ID(count) = tour(i-1+min_member(1));
    pop_sel(count, 1:k) = pop( ID(count), 1:k);
end

