% -------------------------- rGA ----------------------------------------
%   Single Objective Genetic Algorithm
%   with Real Parameter Handling using SBX
%   and Polynomial Mutation + Elite Preserv.
%   Before using this code read file read.me
%
%   Date: 16 May 2014
%   Computational Optimization and
%   Innovation Laboratory (COIN)
%   http://www.coin-laboratory.com
%   Email: kdeb@egr.msu.edu
%
%   Michigan State University (MSU)
%   Electrical and Computer Engineering
% -----------------------------------------------------------------------
clear all; close all; clc; format short g;
seed = 0;

[N, k, problem, ncon, Xmin, Xmax, max_gen, p_cross, p_mut, eta_c, eta_m] = setParam();
n_realcross = 0;
n_realmut = 0;

%--------------------------------------------------------------------------
% CREATE INITIAL POPULATION
%--------------------------------------------------------------------------
disp('>>> Initial Generation');
pop = initializePop(N, k, Xmin, Xmax);

%--------------------------------------------------------------------------
% EVALUATE FITNESS
%--------------------------------------------------------------------------
% NOTE: All objectives should be of MINIMIZATION type
pop = evaluate_fitness(pop, problem, k, ncon);

gen = 1; % Generation # 0
fid1 = fopen('all_generations.out', 'wt');
fid2 = fopen('statistics.out','wt');
fid1 = report(pop, k, N, fid1, gen, seed); % gen = 1
feasID = pop(:, k+2) == 0;
[min_fitness, bestID] = min( pop(feasID, k+1) );
avg_fitness = sum(pop(:, k+1))/N;
disp(['Best Individual Fitness= ' num2str( min_fitness) ...
    ', Average Fitness of the population= ' num2str( avg_fitness ) ]);
disp(['Best Individual= [' num2str(pop(bestID, 1:k)) ' ].'])
fprintf(fid2,' %d %e  %e \n',gen,min_fitness,avg_fitness);

%--------------------------------------------------------------------------
% START GENERATIONS
%--------------------------------------------------------------------------
gen = 2; % Second Generation
while gen <= max_gen

    disp(['>>> Current Generation: ' num2str(gen)]);

    %--------------------------------------------------------------
    % REPRODUCTION (BINARY TOURNAMENT SELECTION)
    %--------------------------------------------------------------
    pop_sel = tournament(pop, k);

    %--------------------------------------------------------------
    % CROSSOVER (SBX)
    %--------------------------------------------------------------
    [pop_xover, n_realcross] = sbx( pop_sel, p_cross, n_realcross, eta_c, Xmin, Xmax );

    %--------------------------------------------------------------
    % MUTATION (PolyMut)
    %--------------------------------------------------------------
    [pop_mut, n_realmut] = pol_mut( pop_xover, p_mut, n_realmut, eta_m, Xmin, Xmax );

    % --------------------------------------------------------------- %
    % COMBINE PARENTS-CHILDREN & REDUCE POPULATION SIZE TO N
    % --------------------------------------------------------------- %
    pop = combine_and_reduce(pop, pop_mut, problem, ncon); % elite preservation
    
    % --------------------------------------------------------------- %
    % REPORT
    % --------------------------------------------------------------- %
    fid1 = report(pop, k, N, fid1, gen, seed);
    feasID = pop(:, k+2) == 0;
    [min_fitness, bestID] = min( pop(feasID, k+1) );
    avg_fitness = sum(pop(:,k+1))/N;
    disp(['Best Individual Fitness= ' num2str( min_fitness) ...
        ', Average Fitness of the population= ' num2str( avg_fitness ) ]);
    disp(['Best Individual= [' num2str(pop(bestID, 1:k)) ' ].'])
    fprintf(fid2,' %d %e  %e \n',gen,min_fitness,avg_fitness);
    % --------------------------------------------------------------- %
    gen = gen+1;

end

% END OF ITERATIONS

fclose(fid1); fclose(fid2);

