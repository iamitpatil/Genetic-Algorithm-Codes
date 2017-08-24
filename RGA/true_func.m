% Define your objective function and constraints here
% objective function (f) is minimized by default
% "g(x)>=0" constraints are assumed by default, type g(1), ...
% For g(x)<=0, use -g(x) 
%
function f_and_g = true_func(x, problem, ncon) % add a counter!!!
if ncon > 0
     g = zeros(1, ncon);
end

switch problem
    case 1 % Unconstraint problem
        % Problem-1: Himmelblau function with 2 constraints
        f = (x(1)^2+x(2)-11)^2  + (x(1)+x(2)^2-7)^2;
        
    case 2 % Constraint problem as unconstraint approach 
        % Problem-1: Himmelblau function with penalty function approach
        f = (x(1)^2+x(2)-11)^2  + (x(1)+x(2)^2-7)^2;
        g(1) = (-26 + (x(1)-5)^2 + x(2)^2) / 26;
        g(2) = (20 - 4*x(1) - x(2)) / 20;
        % This case uses penalty function approach, it requires a R value
        PenaltyParam = 1e7;
        cv = 0;
        for i=1:2
            if g(i) < 0
                cv = cv + abs(g(i));
            end
        end
        f = f + PenaltyParam * cv; % it minimizes this unconstraint fn.
        
    case 3 % Constraint problem using penalty-parameter-less approach (Deb, 2000, CMAME)
        % Constraint Himmelblau's problem
        % put your objective function here
        f = (x(1)^2+x(2)-11)^2  + (x(1)+x(2)^2-7)^2;
        % constraints must be put as g(x) >= 0
        g(1) = (-26 + (x(1)-5)^2 + x(2)^2) / 26;
        g(2) = (20 - 4*x(1) - x(2)) / 20;
        
    case 4 % Another example of unconstraint problem
        % Rosenbrock fuction (2-D)
        f = 100*(x(2)-x(1)^2)^2 + (x(1)-1)^2;      
end
% Do not change anything below 
if ncon == 0
    f_and_g = [f, 0];
elseif ncon > 0
    for i=1:ncon
        if g(i) < 0
            g(i) = abs(g(i));
        else
            g(i) = 0;
        end
    end
    f_and_g = [f, sum(g)];
    
end