function data = problem_inputs(problem)

switch problem
    
    case 0
        % Your own problem
        data.popsize = 0; % Population size (a multiple of 4)
        data.ngen = 0; % Number of generations
        data.nobj = 0; % Number of objectives
        data.ncon = 0; % Number of constraints
        data.nreal = 0; % Number of real variables
        data.min_realvar = []; % Minimum value of i^{th} real variable
        data.max_realvar = []; % Maximum value of i^{th} real variable
        data.pcross_real = 0; % Probability of crossover of real variable
        data.pmut_real = 0; % Probability of mutation of real variable
        data.eta_c = 0; % Distribution index for real variable SBX crossover
        data.eta_m = 0; % Distribution index for real variable polynomial mutation
        data.nbin = 0; % Number of binary variables
        data.nbits = []; % Number of bits for i^{th} binary variable
        data.min_binvar = []; % Minimum value of i^{th} binary variable
        data.max_binvar = []; % Maximum value of i^{th} binary variable
        data.pcross_bin = 0; % Probability of crossover for binary variable
        data.pmut_bin = 0; % Probability of mutation for binary variable
        
    case 1
        % Test Problem SCH1
        % # of real variables = 1
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 48;
        data.ngen = 100; % This was 500!
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 1;
        data.min_realvar = -10;
        data.max_realvar = 10;
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
    case 2
        % Test Problem SCH2
        % # of real variables = 1
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 48;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 1;
        data.min_realvar = -5;
        data.max_realvar = 10;
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c =10;
        data.eta_m = 20;
        data.nbin = 0;
        
    case 3
        % Test Problem FON
        % # of real variables = n
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 100;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 5;
        data.min_realvar = [-4 -4 -4 -4 -4];
        data.max_realvar = [4 4 4 4 4];
        data.pcross_real = 0.9;
        data.pmut_real = 0.2;
        data.eta_c = 10;
        data.eta_m = 10;
        data.nbin = 0;
        
    case 4
        % Test Problem KUR
        % # of real variables = 3
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 100;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 3;
        data.min_realvar = [-5 -5 -5];
        data.max_realvar = [5 5 5];
        data.pcross_real = 0.9;
        data.pmut_real = 0.33;
        data.eta_c = 10;
        data.eta_m = 10;
        data.nbin = 0;
        
    case 5
        % Test Problem POL
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 100;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 2;
        data.min_realvar = [-3.15 -3.15];
        data.max_realvar = [3.15 3.15];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 10;
        data.nbin = 0;
        
    case 6
        % Test Problem VNT
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 3
        % # of constraints = 0
        data.popsize = 300;
        data.ngen = 500;
        data.nobj = 3;
        data.ncon = 0;
        data.nreal = 2;
        data.min_realvar = [-3 -3];
        data.max_realvar = [3 3];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 25;
        data.eta_m = 25;
        data.nbin = 0;
        
    case 7
        % Test Problem ZDT1
        % # of real variables = 30
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 48;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 3;
        data.min_realvar = zeros(1,data.nreal);
        data.max_realvar = ones(1,data.nreal);
        data.pcross_real = 0.9;
        data.pmut_real = 0.033;
        data.eta_c = 15;
        data.eta_m = 20;
        data.nbin = 0;
        
    case 8
        % Test Problem ZDT2
        % # of real variables = 30
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 100;
        data.ngen = 200;
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 30;
        data.min_realvar = zeros(1,data.nreal);
        data.max_realvar = ones(1,data.nreal);
        data.pcross_real = 0.9;
        data.pmut_real = 0.033;
        data.eta_c = 15;
        data.eta_m = 20;
        data.nbin = 0;
        
    case 9
        % Test Problem ZDT3
        % # of real variables = 30
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 100;
        data.ngen = 200;
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 30;
        data.min_realvar = zeros(1,data.nreal);
        data.max_realvar = ones(1,data.nreal);
        data.pcross_real = 0.9;
        data.pmut_real = 0.033;
        data.eta_c = 15;
        data.eta_m = 20;
        data.nbin = 0;
        
    case 10
        % Test Problem ZDT4
        % # of real variables = 10
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 100;
        data.ngen = 200;
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 10;
        data.min_realvar = [0 -5*ones(1,data.nreal-1)];
        data.max_realvar = [1 5*ones(1,data.nreal-1)];
        data.pcross_real = 0.9;
        data.pmut_real = 0.1;
        data.eta_c = 15;
        data.eta_m = 20;
        data.nbin = 0;
        
    case 11
        % Test Problem ZDT5
        % # of real variables = 0
        % # of bin variables = 11
        % # of bits for binvar1 = 30
        % # of bits for binvar2-11 = 5
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 100;
        data.ngen = 300;
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 0;
        data.nbin = 11;
        data.nbits = [30 5*ones(1,data.nbin-1)];
        data.min_binvar = zeros(1,data.nbin+1);
        data.max_binvar = [30 5*ones(1,data.nbin-1)];
        data.pcross_bin = 0.9;
        data.pmut_bin = 0.0125;
        
    case 12
        % Test Problem ZDT6
        % # of real variables = 10
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        data.popsize = 100;
        data.ngen = 400;
        data.nobj = 2;
        data.ncon = 0;
        data.nreal = 10;
        data.min_realvar = zeros(1,data.nreal);
        data.max_realvar = ones(1,data.nreal);
        data.pcross_real = 0.9;
        data.pmut_real = 0.1;
        data.eta_c = 15;
        data.eta_m = 20;
        data.nbin = 0;
        
    case 13
        % Test Problem BNH
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        data.popsize = 100;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 2;
        data.nreal = 2;
        data.min_realvar = [0 0];
        data.max_realvar = [5 3];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
    case 14
        % Test Problem OSY
        % # of real variables = 6
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 6
        data.popsize = 200;
        data.ngen = 250;
        data.nobj = 2;
        data.ncon = 6;
        data.nreal = 6;
        data.min_realvar = [0 0 1 0 1 0];
        data.max_realvar = [10 10 5 6 5 10];
        data.pcross_real = 0.9;
        data.pmut_real = 0.1667;
        data.eta_c = 5;
        data.eta_m = 5;
        data.nbin = 0;
        
    case 15
        % Test Problem SRN
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        data.popsize = 100;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 2;
        data.nreal = 2;
        data.min_realvar = [-20 -20];
        data.max_realvar = [20 20];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 5;
        data.eta_m = 5;
        data.nbin = 0;
        
    case 16
        % Test Problem TNK
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        data.popsize = 200;
        data.ngen = 300;
        data.nobj = 2;
        data.ncon = 2;
        data.nreal = 2;
        data.min_realvar = [0 0];
        data.max_realvar = [3.15 3.15];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 5;
        data.eta_m = 5;
        data.nbin = 0;
        
    case 17
        % Test Problem CTP1
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        data.popsize = 200;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 2;
        data.nreal = 2;
        data.min_realvar = [0 0];
        data.max_realvar = [1 1];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
    case 18
        % Test Problem CTP2
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        data.popsize = 200;
        data.ngen = 150;
        data.nobj = 2;
        data.ncon = 1;
        data.nreal = 2;
        data.min_realvar = [0 0];
        data.max_realvar = [1 1];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
    case 19
        % Test Problem CTP3
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        data.popsize = 200;
        data.ngen = 150;
        data.nobj = 2;
        data.ncon = 1;
        data.nreal = 2;
        data.min_realvar = [0 0];
        data.max_realvar = [1 1];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
        case 20
        % Test Problem CTP4
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        data.popsize = 100;
        data.ngen = 1000;
        data.nobj = 2;
        data.ncon = 1;
        data.nreal = 2;
        data.min_realvar = [0 0];
        data.max_realvar = [1 1];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
        case 21
        % Test Problem CTP5
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        data.popsize = 200;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 1;
        data.nreal = 2;
        data.min_realvar = [0 0];
        data.max_realvar = [1 1];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
        case 22
        % Test Problem CTP6
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        data.popsize = 200;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 1;
        data.nreal = 2;
        data.min_realvar = [0 0];
        data.max_realvar = [1 10];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
        case 23
        % Test Problem CTP7
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        data.popsize = 200;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 1;
        data.nreal = 2;
        data.min_realvar = [0 0];
        data.max_realvar = [1 10];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
        case 24
        % Test Problem CTP8
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        data.popsize = 200;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 2;
        data.nreal = 2;
        data.min_realvar = [0 0];
        data.max_realvar = [1 10];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
        case 25
        % Test Problem CONSTR
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        data.popsize = 48;
        data.ngen = 100;
        data.nobj = 2;
        data.ncon = 2;
        data.nreal = 2;
        data.min_realvar = [0.1 0];
        data.max_realvar = [1 5];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
        case 26
        % Test Problem CONSTR-EPSCONSTR
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 1
        % # of constraints = 3
        data.popsize = 48;
        data.ngen = 100;
        data.nobj = 1;
        data.ncon = 3;
        data.nreal = 2;
        data.min_realvar = [0.1 0];
        data.max_realvar = [1 5];
        data.pcross_real = 0.9;
        data.pmut_real = 0.5;
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
        case 27
        % Test Problem DTLZ2
        % # of real variables = 7
        % # of bin variables = 0
        % # of objectives = 3
        % # of constraints = 2
        data.popsize = 100; % usually =10 * data.nreal
        data.ngen = 100;
        data.nobj = 3;
        data.ncon = 0;
        data.nreal = 7;
        data.min_realvar = [0 0 0 0 0 0 0]; % =zeros(1,data.nreal);
        data.max_realvar = [1 1 1 1 1 1 1]; % =ones(1,data.nreal);
        data.pcross_real = 0.9;
        data.pmut_real = 0.147;  % usually 1/data.nreal
        data.eta_c = 10;
        data.eta_m = 20;
        data.nbin = 0;
        
end