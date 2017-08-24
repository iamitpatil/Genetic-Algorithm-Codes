function domination = check_dominance(a, b, nobj, ncon, nreal, nbin)
% Routine for usual non-domination checking
% It will return the following values
% 1 if a dominates b
% -1 if b dominates a
% 0 if both a and b are non-dominated
flag1 = 0;
flag2 = 0;
n_consviol = nobj+ncon+nreal+nbin+1;

% a and b are individual types
if (a(1,n_consviol) < 0) && (b(1,n_consviol) < 0)
    if (a(1,n_consviol) > b(1,n_consviol))
        domination = 1;
    else
        if (a(1,n_consviol) < b(1,n_consviol))
            domination = -1;
        else
            domination = 0;
        end
    end
else
    if (a(1,n_consviol) < 0) && (b(1,n_consviol) == 0)
        domination = -1;
    else
        if (a(1,n_consviol) == 0) && (b(1,n_consviol) < 0)
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
                    
                
    
        