function report_pop(pop, fpt, popsize, nobj, ncon, nreal, nbin)
% Function to print the information of a population in a file

for i=1:popsize
    for j=1:nobj
        fprintf(fpt, '%e\t', pop(i,j));
       
    end
    if (ncon ~= 0)
        for j=1:ncon
            fprintf(fpt, '%e\t', pop(i,nobj+j));
        end
    end
    if (nreal ~= 0)
        for j=1:nreal
            fprintf(fpt, '%e\t', pop(i,nobj+ncon+j));
        end
    end
    if (nbin ~= 0)
        for j=1:nbin
            fprintf(fpt, '%e\t', pop(i,nobj+ncon+nreal+j));
        end
    end
    fprintf(fpt, '%e\t', pop(i,nobj+ncon+nreal+nbin+1));
    fprintf(fpt, '%d\t', pop(i,nobj+ncon+nreal+nbin+2));
    fprintf(fpt, '%e\n', pop(i,nobj+ncon+nreal+nbin+3));
end
    
    