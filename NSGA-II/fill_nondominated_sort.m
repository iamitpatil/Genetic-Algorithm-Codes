function [new_pop, new_pop_strings] = fill_nondominated_sort(pop, pop_strings, nobj, ncon, nreal, nbin)
N = size(pop,1);
fitsize = N/2;
[sorted_ranks, rankID] = sort(pop(:,nobj+ncon+nreal+nbin+2));
parentID = []; front = 1; front_array = [];
while size(parentID,2) < fitsize
    for i=1:N
        if sorted_ranks(i) ~= front
            break
        end
        front_array = [front_array rankID(i)];
    end
    size_check = size(parentID,2) + size(front_array,2);
    if size_check == fitsize
        parentID = [parentID front_array];
        break
    elseif size_check < fitsize
        parentID = [parentID front_array];
        sorted_ranks(1:size(front_array,2)) = [];
        rankID(1:size(front_array,2)) = [];
        N = N - size(front_array,2);
        front = front+1;
        front_array = [];
    else
        miss_size = fitsize - (size_check - size(front_array,2));
%original code
%         if ncon > 0
%             [~, consviolationID] = sort(pop(front_array,nobj+ncon+nreal+nbin+1), 'descend');
%             parentID = [parentID front_array(consviolationID(1:miss_size))];
%         else
%             [~, distID] = sort(pop(front_array,end), 'descend');
%             parentID = [parentID front_array(distID(1:miss_size))];
%         end

% below is corrected code by Ling Zhu
        n_consviol = nobj+ncon+nreal+nbin+1;
        n_rank= nobj+ncon+nreal+nbin+2;
        n_crowd = n_rank+1;

        if ncon==0,% if the problem does not have any constraints
           
            % sort crowding distance and select miss_size number of top individuals  
            % and add them to the parent pop
            [~, distID] = sort(pop(front_array,n_crowd), 'descend');
            parentID = [parentID front_array(distID(1:miss_size))];
            
        else % if the problem have constraints
            
            %calculate the number of the feasible individuals
            feasible_ind=find(pop(front_array,n_consviol)==0);
            feasible_ind=(front_array(feasible_ind));
            number_feasible_ind=length(feasible_ind);
            
            if  number_feasible_ind > miss_size,   
                % sort feasible individuals based on crowdind distance 
                % select the best miss_size of them and add them to parent
                % pop
                [~, distID] = sort(pop(feasible_ind,n_crowd), 'descend');
                parentID = [parentID feasible_ind(distID(1:miss_size))];       
            elseif number_feasible_ind == miss_size,
                parentID = [parentID feasible_ind]; 
            else % where number_feasible_ind < miss_size,
                % sort based on the constraint violation,
                [~, consviolationID] = sort(pop(front_array,n_consviol), 'descend');
                parentID = [parentID front_array(consviolationID(1:miss_size))];
            end
        end
    end
end

new_pop = pop(parentID,:);
if nreal ~= 0
    %new_pop = pop(parentID,:);
    if nbin == 0
        new_pop_strings = [];
    end
end
if nbin ~= 0
    new_pop_strings = pop_strings(parentID,:);
end


