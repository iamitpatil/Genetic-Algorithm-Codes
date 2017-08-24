function pop = domination_check(N, pareto, nobj)
front1_ID = [];
j_dom_i = 0;
for i=1:N
    for j=1:N
        if j ~= i
            j_dom_i = dominance_check(pareto(j,:), pareto(i,:), nobj); % 1: j dominates i; -1: i dominates j; 0: both are non-dominated.
            if j_dom_i == 1
                break
            end
        end
    end
    if j_dom_i ~= 1
        front1_ID=[front1_ID i];
    end
    j_dom_i = 0;
end
pop = pareto(front1_ID,:);
%-------------------------------------------------
function domination = dominance_check(a, b, nobj)
% Routine for usual non-domination checking
% It will return the following values
% 1 if a dominates b
% -1 if b dominates a
% 0 if both a and b are non-dominated
flag1 = 0;
flag2 = 0;

% a and b are individual types
if (a(1,end-2) < 0) && (b(1,end-2) < 0)
    if (a(1,end-2) > b(1,end-2))
        domination = 1;
    else
        if (a(1,end-2) < b(1,end-2))
            domination = -1;
        else
            domination = 0;
        end
    end
else
    if (a(1,end-2) < 0) && (b(1,end-2) == 0)
        domination = -1;
    else
        if (a(1,end-2) == 0) && (b(1,end-2) < 0)
            domination = 1;
        else
            for i=1:nobj
                if (a(1,i) < b(1,i))
                    flag1 = 1;
                else
                    if a(1,i) > b(1,i)
                        flag2 = 1;
                    end
                end
            end
            if (flag1 == 1) && (flag2 == 0)
                domination = 1;
            else
                if (flag1 == 0) && (flag2 == 1)
                    domination = -1;
                else % (flag1 == 0 && flag2 == 0) or (flag1 == 1 && flag2 == 1)
                    domination = 0;
                end
            end
        end
    end
end