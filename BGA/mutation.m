function offsprings = mutation(offsprings, probMutation)



[offsprings_row, offsprings_col] = size(offsprings);

for m = 1:offsprings_row
    for n = 1:offsprings_col
        bitLength(n) = length(offsprings{m,n});
        for i = 1:bitLength(n)
            if rand<probMutation
                if  offsprings{m,n}(i) == '1';
                    offsprings{m,n}(i) = '0';
                elseif offsprings{m,n}(i) == '0';
                    offsprings{m,n}(i) = '1';
                end
            end
        end
    end
end
    



            
