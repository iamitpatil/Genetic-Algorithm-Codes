% Reporting populatuion stats
%
function fid1 = report(pop, k, N, fid1, gen, seed)
%
format_str = '';
for i = 1 : (k+2)
    format_str = [format_str, '%10.5f '];
end
format_str = [format_str, '\n'];

if gen == 1
    fprintf(fid1, 'Seed = %d\n\n', seed);
    fprintf(fid1, 'Generation = %d\n\n', gen);
    for i = 1 : (k+2)
        if i <= k
            fprintf(fid1, '     x(%d)  ', i);
        elseif i == k+1
            fprintf(fid1, '     f(%d)  ', i-k);
        else
            fprintf(fid1, '     CV\t\n');
        end
    end
    
    for i = 1 : (k+1)
        fprintf(fid1, '----------');
    end
    fprintf(fid1, '----------\n');
    
    for i = 1:N
        fprintf(fid1, format_str, pop(i, :));
    end
    
else
    
    fprintf(fid1, '\nGeneration = %d\n\n', gen);
    for i = 1:N
        fprintf(fid1, format_str, pop(i, :));
    end
    
end