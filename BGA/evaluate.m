function fitness = evaluate(binMembers, minDim, maxDim, maximization)



decMembers = decode(binMembers, minDim, maxDim);

[dec_row, dec_col] = size(decMembers);

for i=1:dec_row
    fitness(i,:) = objectiveFunction(decMembers(i,:), maximization);
end

function functionValue=objectiveFunction(member, maximization)

functionValue = 0.0;
%for i=1:length(member)
%    functionValue = functionValue + member(i).^2;
%end
%functionValue = 100-sum((member - 1.5).^2);

fValue = (member(1)^2+member(2)-11.0)^2;
functionValue = maximization * (fValue + (member(1)+member(2)^2-7.0)^2);
