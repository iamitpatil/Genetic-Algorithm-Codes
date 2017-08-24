function pareto_last = NSGA2_postprocess(pop, ngen, nbits, min_binvar, max_binvar, problem, nobj, ncon, nreal, nbin)

switch problem
    case 0
        title_string = 'User Defined Problem';
    case 1
        title_string = 'Test Problem SCH1';
    case 2
        title_string = 'Test Problem SCH2';
    case 3
        title_string = 'Test Problem FON';
    case 4
        title_string = 'Test Problem KUR';
    case 5
        title_string = 'Test Problem POL';
    case 6
        title_string = 'Test Problem VNT';
    case 7
        title_string = 'Test Problem ZDT1';
    case 8
        title_string = 'Test Problem ZDT2';
    case 9
        title_string = 'Test Problem ZDT3';
    case 10
        title_string = 'Test Problem ZDT4';
    case 11
        title_string = 'Test Problem ZDT5';
    case 12
        title_string = 'Test Problem ZDT6';
    case 13
        title_string = 'Test Problem BNH';
    case 14
        title_string = 'Test Problem OSY';
    case 15
        title_string = 'Test Problem SRN';
    case 16
        title_string = 'Test Problem TNK';
    case 17
        title_string = 'Test Problem CTP1';
    case 18
        title_string = 'Test Problem CTP2';
    case 19
        title_string = 'Test Problem CTP3';
    case 20
        title_string = 'Test Problem CTP4';
    case 21
        title_string = 'Test Problem CTP5';
    case 22
        title_string = 'Test Problem CTP6';
    case 23
        title_string = 'Test Problem CTP7';
    case 24
        title_string = 'Test Problem CTP8';
end
        

fid = fopen('all_pop.out');
N = size(pop,1);
ntotal = ngen*N;
ncolumn = nobj+ncon+nreal+nbin+3;
clear pop

data = zeros(ntotal, ncolumn);
str = fgetl(fid);
count = 0;

disp('    "all_pop.out" file is being processed...')
tic;
while 1
    if ~isempty(str2num(str(1:2)))
        count = count+1;
        temp = str2num(str);
        if nbin ~= 0
            string = temp(nobj+ncon+nreal+1 : end-3);
            xbin = decode_for_postprocess(string, nbin, nbits, min_binvar, max_binvar);
        else
            xbin = [];
        end
        data(count,1:ncolumn) = [temp(1:nobj+ncon+nreal) xbin temp(nobj+ncon+nreal+nbin+1:end)];
    elseif isequal(str,'eof')
        break
    end
    str = fgetl(fid);
end
fclose(fid);
disp(['>>> "all_pop.out" file has been processed ( ' num2str(toc/60) ' minutes).'])

disp('    Feasible and Infeasible solutions are being identified...')
tic;
feas = [];
infeas = [];
for i=1:count
    if ncon == 0
        feas = data;
        break
    else
        if data(i,ncolumn-2) == 0
            feas = [feas; data(i,:)];
        else
            infeas = [infeas; data(i,:)];
        end
    end
end
disp(['>>> Feasible and Infeasible solutions have been identified ( ' num2str(toc/60) ' minutes).'])

disp('    Solutions with RANK=1 are being collected...')
tic;
nfeas = size(feas,1);
ninfeas = size(infeas,1);
pareto_sum = [];
for i=1:nfeas
    if feas(i,ncolumn-1) == 1
        pareto_sum = [pareto_sum; feas(i,:)];
    end
end
par_size = size(pareto_sum,1);
disp(['>>> Solutions with RANK=1 have been collected ( ' num2str(toc/60) ' minutes).'])

disp('    "Global" Pareto-optimal solutions are being identified...')
tic;
pareto_last = domination_check(par_size, pareto_sum, nobj);
disp(['>>> "Global" Pareto-optimal solutions have been identified ( ' num2str(toc/60) ' minutes).'])

disp('    Similarity check among global Pareto-optimal solutions is being performed...')
tic;
i = 1; check_all_j = 0; index = [];
while check_all_j ~= 1
    j = 1;
    while j<=size(pareto_last,1)
        if (j ~= i) && (isequal(pareto_last(i,1:ncolumn-2), pareto_last(j,1:ncolumn-2)))
            index = [index; j];
        end
        j = j+1;
    end
    pareto_last(index,:) = []; index = []; i = i+1;
    if size(pareto_last,1) < i
        check_all_j = 1;
    else
        check_all_j = 0;
    end
end
N_last = size(pareto_last,1);
disp(['>>> Similarity check among global Pareto-optimal solutions has been performed ( ' num2str(toc/60) ' minutes).'])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
plot(feas(:,1),feas(:,2),...
    'Marker','o','MarkerSize',6,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','b',...
    'LineStyle','none'); 
hold on;
if ncon ~= 0
    plot(infeas(:,1),infeas(:,2),...
        'Marker','o',...
        'MarkerSize',6,...
        'MarkerEdgeColor','k',...
        'MarkerFaceColor','r',...
        'LineStyle','none');
end
plot(pareto_last(:,1),pareto_last(:,2),...
    'Marker','o',...
    'MarkerSize',6,...
    'LineWidth', 2, ...
    'MarkerEdgeColor','g',...
    'LineStyle','none');
xlabel('Minimize f_1',...
    'FontWeight', 'bold',...
    'FontSize', 11, ...
    'FontName', 'Tahoma')
ylabel('Minimize f_2',...
    'FontWeight', 'bold',...
    'FontSize', 11,...
    'FontName', 'Tahoma')
title([title_string ' (Pop. size=' num2str(N) ', Gen._{max}=' num2str(ngen) ')'],...
    'FontWeight', 'bold', ...
    'FontSize', 11, ...
    'FontName', 'Tahoma')
if ncon == 0
legend(['Feasible (' num2str(nfeas) ')'],...
    ['Pareto (' num2str(N_last) ')'], ...
    'Location', 'best')
else
    legend(['Feasible (' num2str(nfeas) ')'],...
    ['Infeasible (' num2str(ninfeas) ')'], ...
    ['Pareto (' num2str(N_last) ')'], ...
    'Location', 'best')
end
grid on
hold off
saveas(gcf,'All_Pop.fig')
print('-dtiff','-r300','All_Pop')

