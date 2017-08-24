% Evaluation of Population members
%
function pop = evaluate_fitness(pop, problem, k, ncon)
N = size(pop,1);

for i=1:N
    pop(i, k+1 : k+1+1) = true_func( pop(i, 1:k), problem, ncon );
end   
