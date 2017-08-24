function [N, k, problem, ncon, Xmin, Xmax, max_gen, p_cross, p_mut, eta_c, eta_m] = setParam()
%---------------------------
%       Define TEST PROBLEMS
%       Following three are already defined
%---------------------------
%       1) prob1
%       2) prob1 with penalty function approach
%       3) prob2
%       4) Rosenbrock

problem = 1; % Test Problem ID

switch problem  
    case 1
        k = 2;           % number of variables
        ncon = 0;        % number of constraints
        Xmin = [0 0];    % lower bound of var-vector
        Xmax = [5 5];    % upper bound of var-vector
        
    case 2
        k = 2;
        ncon = 0; % constraints are handled by penalty function
        Xmin = [0 0];
        Xmax = [5 5];
    
    case 3 % Constraint handling
        k = 2;
        ncon = 2;
        Xmin = [0 0];
        Xmax = [5 5];
        
    case 4
        k = 2;
        ncon = 0;
        Xmin = [-10 -10];
        Xmax = [10 10];      
end
% Set RGA parameters here
N = 20 * k; % Population size (usually 5-10 x number of variables)
max_gen = 250; % Maximum generation number, usually 30-100
p_cross = 0.9; % Crossover probability, usually 0.8-1.0
p_mut = 1.0/k; % Mutation probability, usually 1/#var
eta_c = 3; % Distribution index for SBX, usually 2-5 
eta_m = 20; % Distribution index for polynomial mutation, usually 10-100



