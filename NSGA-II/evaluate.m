function pop = evaluate(pop, popsize, problem, nobj, ncon, nreal, nbin)
global PI
if nreal > 0
    xreal = pop(:, nobj+ncon+1:nobj+ncon+nreal);
end
if nbin > 0
    xbin = pop(:, nobj+ncon+nreal+1:nobj+ncon+nreal+nbin);
end
if (nreal == 0) && (nbin == 0)
    display('There are no binary and real variables defined!')
    return
end
% Objectives for i-th pop member:
% pop(i,1) = objective 1
% pop(i,2) = objective 2
% ...
% pop(i,nobj) = objective nobj
% Constraints for i-th pop member:
% pop(i,nobj+1) = g(1)
% ...
% pop(i,nobj+ncon) = g(ncon)

switch problem
    
    case 0
        % Your own problem
    case 1
        % Test Problem SCH1
        % # of real variables = 1
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        for i=1:popsize
            pop(i,1) = xreal(i,1)^2;
            pop(i,2) = (xreal(i,1)-2.0)^2;
        end
        
    case 2
        % Test Problem SCH2
        % # of real variables = 1
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        for i=1:popsize
            if (xreal(i,1) <= 1.0)
                pop(i,1) = -xreal(i,1);
                pop(i,2) = (xreal(i,1)-5.0)^2;
            elseif (xreal(i,1) <= 3.0)
                pop(i,1) = xreal(i,1) - 2.0;
                pop(i,2) = (xreal(i,1)-5.0)^2;
            elseif (xreal(i,1) <= 4.0)
                pop(i,1) = 4.0 - xreal(i,1);
                pop(i,2) = (xreal(i,1)-5.0)^2;
            else
                pop(i,1) = xreal(i,1) - 4.0;
                pop(i,2) = (xreal(i,1)-5.0)^2;
            end
        end
        
    case 3
        % Test Problem FON
        % # of real variables = n
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        s1 = 0.0; s2 = 0.0;
        for i=1:popsize
            for j=1:nreal
                s1 = s1 + (xreal(i,j) - (1.0 / sqrt(nreal)))^2;
                s2 = s2 + (xreal(i,j) + (1.0 / sqrt(nreal)))^2;
            end
            pop(i,1) = 1.0 - exp(-s1);
            pop(i,2) = 1.0 - exp(-s2);
        end
        
    case 4
        % Test Problem KUR
        % # of real variables = 3
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        for i=1:popsize
            res1 = -0.2 * sqrt(xreal(i,1)^2 + xreal(i,2)^2);
            res2 = -0.2 * sqrt(xreal(i,2)^2 + xreal(i,3)^2);
            pop(i,1) = -10.0 * (exp(res1) + exp(res2));
            pop(i,2) = 0.0;
            for j=1:3
                pop(i,2) = pop(i,2) + abs(xreal(i,j))^0.8 + 5.0 * sin(xreal(i,j)^3);
            end
        end
        
    case 5
        % Test Problem POL
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        for i=1:popsize
            a1 = 0.5*sin(1.0) - 2.0*cos(1.0) + sin(2.0) - 1.5*cos(2.0);
            a2 = 1.5*sin(1.0) - cos(1.0) + 2.0*sin(2.0) - 0.5*cos(2.0);
            b1 = 0.5*sin(xreal(i,1)) - 2.0*cos(xreal(i,1)) + sin(xreal(i,2)) - 1.5*cos(xreal(i,1));
            b2 = 1.5*sin(xreal(i,1)) - cos(xreal(i,1)) + 2.0*sin(xreal(i,2)) - 0.5*cos(xreal(i,1));
            pop(i,1) = 1.0 * (a1-b1)^2.0 + (a2-b2)^2.0;
            pop(i,2) = (xreal(i,1)+3.0)^2.0 + (xreal(i,2)+1.0)^2.0;
        end
        
    case 6
        % Test Problem VNT
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 3
        % # of constraints = 0
        for i=1:popsize
            pop(i,1) = 0.5*(xreal(i,1)^2+xreal(i,2)^2) + sin(xreal(i,1)^2+xreal(i,2)^2);
            pop(i,2) = (3.0*xreal(i,1)-2.0*xreal(i,2)+4.0)^2 / 8.0 + (xreal(i,1)-xreal(i,2)+1.0)^2 / 27.0 + 15.0;
            pop(i,3) = 1.0 / (xreal(i,1)^2+xreal(i,2)^2+1.0) - 1.1*exp( -( xreal(i,1)^2 + xreal(i,2)^2 ) );
        end
        
    case 7
        % Test Problem ZDT1
        % # of real variables = 30
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        for i=1:popsize
            pop(i,1) = xreal(i,1);
            g = 0.0;
            for j=2:nreal
                g = g+xreal(i,j);
            end
            g = 9.0*g/(nreal-1);
            g = g+1;
            h = 1.0 - sqrt(pop(i,1)/g);
            f2 = g*h;
            pop(i,2) = f2;
        end
        
    case 8
        % Test Problem ZDT2
        % # of real variables = 30
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        for i=1:popsize
            pop(i,1) = xreal(i,1);
            g = 0.0;
            for j=2:nreal
                g = g+xreal(i,j);
            end
            g = 9.0*g/(nreal-1);
            g = g+1;
            h = 1.0 - (pop(i,1)/g)^2;
            f2 = g*h;
            pop(i,2) = f2;
        end
        
    case 9
        % Test Problem ZDT3
        % # of real variables = 30
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        for i=1:popsize
            pop(i,1) = xreal(i,1);
            g = 0.0;
            for j=2:nreal
                g = g+xreal(i,j);
            end
            g = 9.0*g/(nreal-1);
            g = g+1;
            h = 1.0 - sqrt(pop(i,1)/g) - (pop(i,1)/g)*sin(10.0*PI*pop(i,1));
            f2 = g*h;
            pop(i,2) = f2;
        end
        
    case 10
        % Test Problem ZDT4
        % # of real variables = 10
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        for i=1:popsize
            pop(i,1) = xreal(i,1);
            g = 0.0;
            for j=2:10
                g = g+xreal(i,j)^2 - 10.0*cos(4.0*PI*xreal(i,j));
            end
            g = g+91.0;
            h = 1.0 - sqrt(pop(i,1)/g);
            f2 = g*h;
            pop(i,2) = f2;
        end
        
    case 11
        % Test Problem ZDT5
        % # of real variables = 0
        % # of bin variables = 11
        % # of bits for binvar1 = 30
        % # of bits for binvar2-11 = 5
        % # of objectives = 2
        % # of constraints = 0
        

    case 12
        % Test Problem ZDT6
        % # of real variables = 10
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 0
        for i=1:popsize
            pop(i,1) = 1.0 - exp(-4.0*xreal(i,1)) * (sin(4.0*PI*xreal(i,1)))^6.0;
            g = 0.0;
            for j=2:nreal
                g = g+xreal(i,j);
            end
            g = g/(nreal-1);
            g = g^0.25;
            g = 1.0+(nreal-1)*g;
            h = 1.0 - (pop(i,1)/g)^2;
            f2 = g*h;
            pop(i,2) = f2;
        end
        
    case 13
        % Test Problem BNH
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        for i=1:popsize
            pop(i,1) = 4.0*(xreal(i,1)^2 + xreal(i,2)^2);
            pop(i,2) = (xreal(i,1)-5.0)^2 + (xreal(i,2)-5.0)^2;
            pop(i,nobj+1) = 1.0 - ((xreal(i,1)-5.0)^2 + xreal(i,2)^2) / 25.0;
            pop(i,nobj+2) = ((xreal(i,1)-8.0)^2 + (xreal(i,2)+3.0)^2) / 7.7 - 1.0;
        end
        
    case 14
        % Test Problem OSY
        % # of real variables = 6
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 6
        for i=1:popsize
            pop(i,1) = -( 25.0 * (xreal(i,1)-2.0)^2 + (xreal(i,2)-2.0)^2 + ...
                (xreal(i,3)-1.0)^2 + (xreal(i,4)-4.0)^2 + (xreal(i,5)-1.0)^2);
            pop(i,2) = xreal(i,1)^2 + xreal(i,2)^2 + xreal(i,3)^2 + ...
                xreal(i,4)^2 + xreal(i,5)^2 + xreal(i,6)^2;
            pop(i,nobj+1) = (xreal(i,1)+xreal(i,2)) / 2.0 - 1.0;
            pop(i,nobj+2) = 1.0 - (xreal(i,1)+xreal(i,2)) / 6.0;
            pop(i,nobj+3) = 1.0 - xreal(i,2)/2.0 + xreal(i,1)/2.0;
            pop(i,nobj+4) = 1.0 - xreal(i,1)/2.0 + 3.0*xreal(i,2)/2.0;
            pop(i,nobj+5) = 1.0 - (xreal(i,3)-3.0)^2/4.0 - xreal(i,4)/4.0;
            pop(i,nobj+6) = (xreal(i,5)-3.0)^2/4.0 + xreal(i,6)/4.0 - 1.0;
        end
        
    case 15
        % Test Problem SRN
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        for i=1:popsize
            pop(i,1) = 2.0 + (xreal(i,1)-2.0)^2 + (xreal(i,2)-1.0)^2;
            pop(i,2) = 9.0*xreal(i,1) - (xreal(i,2)-1.0)^2;
            pop(i,nobj+1) = 1.0 - (xreal(i,1)^2 + xreal(i,2)^2) / 225.0;
            pop(i,nobj+2) = 3.0 * xreal(i,2)/10.0 - xreal(i,1)/10.0 - 1.0;
        end
        
    case 16
        % Test Problem TNK
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        for i=1:popsize
            pop(i,1) = xreal(i,1);
            pop(i,2) = xreal(i,2);
            if (xreal(i,2) == 0.0)
                pop(i,nobj+1) = -1.0;
            else
                pop(i,nobj+1) = xreal(i,1)^2 + xreal(i,2)^2 - ...
                    0.1*cos(16.0*atan(xreal(i,1)/xreal(i,2))) - 1.0;
            end
            pop(i,nobj+2) = 1.0 - 2.0*(xreal(i,1)-0.5)^2 + 2.0*(xreal(i,2)-0.5)^2;
        end
        
    case 17
        % Test Problem CTP1
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        for i=1:popsize
            g = 1.0 + xreal(i,2);
            pop(i,1) = xreal(i,1);
            pop(i,2) = g*exp(-pop(i,1)/g);
            pop(i,nobj+1) = pop(i,2) / (0.858*exp(-0.541*pop(i,1))) - 1.0;
            pop(i,nobj+2) = pop(i,2) / (0.728*exp(-0.295*pop(i,1))) - 1.0;
        end
        
    case 18
        % Test Problem CTP2
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        for i=1:popsize
            theta = -0.2*PI;
            a = 0.2;
            b = 10.0;
            c = 1.0;
            d = 6.0;
            e = 1.0;
            g = 1.0 + xreal(i,2);
            pop(i,1) = xreal(i,1);
            pop(i,2) = g * (1.0 - sqrt(pop(i,1)/g));
            exp1 = (pop(i,2)-e) * cos(theta) - pop(i,1)*sin(theta);
            exp2 = (pop(i,2)-e) * sin(theta) + pop(i,1)*cos(theta);
            exp2 = b*PI*exp2^c;
            exp2 = abs(sin(exp2));
            exp2 = a*exp2^d;
            pop(i,nobj+1) = exp1/exp2 - 1.0;
        end
        
    case 19
        % Test Problem CTP3
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        for i=1:popsize
            theta = -0.2*PI;
            a = 0.1;
            b = 10.0;
            c = 1.0;
            d = 0.5;
            e = 1.0;
            g = 1.0 + xreal(i,2);
            pop(i,1) = xreal(i,1);
            pop(i,2) = g * (1.0 - sqrt(pop(i,1)/g));
            exp1 = (pop(i,2)-e) * cos(theta) - pop(i,1)*sin(theta);
            exp2 = (pop(i,2)-e) * sin(theta) + pop(i,1)*cos(theta);
            exp2 = b*PI*exp2^c;
            exp2 = abs(sin(exp2));
            exp2 = a*exp2^d;
            pop(i,nobj+1) = exp1/exp2 - 1.0;
        end
        
        case 20
        % Test Problem CTP4
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        for i=1:popsize
            theta = -0.2*PI;
            a = 0.75;
            b = 10.0;
            c = 1.0;
            d = 0.5;
            e = 1.0;
            g = 1.0 + xreal(i,2);
            pop(i,1) = xreal(i,1);
            pop(i,2) = g * (1.0 - sqrt(pop(i,1)/g));
            exp1 = (pop(i,2)-e) * cos(theta) - pop(i,1)*sin(theta);
            exp2 = (pop(i,2)-e) * sin(theta) + pop(i,1)*cos(theta);
            exp2 = b*PI*exp2^c;
            exp2 = abs(sin(exp2));
            exp2 = a*exp2^d;
            pop(i,nobj+1) = exp1/exp2 - 1.0;
        end
        
        case 21
        % Test Problem CTP5
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        for i=1:popsize
            theta = -0.2*PI;
            a = 0.1;
            b = 10.0;
            c = 2.0;
            d = 0.5;
            e = 1.0;
            g = 1.0 + xreal(i,2);
            pop(i,1) = xreal(i,1);
            pop(i,2) = g * (1.0 - sqrt(pop(i,1)/g));
            exp1 = (pop(i,2)-e) * cos(theta) - pop(i,1)*sin(theta);
            exp2 = (pop(i,2)-e) * sin(theta) + pop(i,1)*cos(theta);
            exp2 = b*PI*exp2^c;
            exp2 = abs(sin(exp2));
            exp2 = a*exp2^d;
            pop(i,nobj+1) = exp1/exp2 - 1.0;
        end
        
        case 22
        % Test Problem CTP6
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        for i=1:popsize
            theta = 0.1*PI;
            a = 40.0;
            b = 0.5;
            c = 1.0;
            d = 2.0;
            e = -2.0;
            g = 1.0 + xreal(i,2);
            pop(i,1) = xreal(i,1);
            pop(i,2) = g * (1.0 - sqrt(pop(i,1)/g));
            exp1 = (pop(i,2)-e) * cos(theta) - pop(i,1)*sin(theta);
            exp2 = (pop(i,2)-e) * sin(theta) + pop(i,1)*cos(theta);
            exp2 = b*PI*exp2^c;
            exp2 = abs(sin(exp2));
            exp2 = a*exp2^d;
            pop(i,nobj+1) = exp1/exp2 - 1.0;
        end
        
        case 23
        % Test Problem CTP7
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 1
        for i=1:popsize
            theta = -0.05*PI;
            a = 40.0;
            b = 5.0;
            c = 1.0;
            d = 6.0;
            e = 0.0;
            g = 1.0 + xreal(i,2);
            pop(i,1) = xreal(i,1);
            pop(i,2) = g * (1.0 - sqrt(pop(i,1)/g));
            exp1 = (pop(i,2)-e) * cos(theta) - pop(i,1)*sin(theta);
            exp2 = (pop(i,2)-e) * sin(theta) + pop(i,1)*cos(theta);
            exp2 = b*PI*exp2^c;
            exp2 = abs(sin(exp2));
            exp2 = a*exp2^d;
            pop(i,nobj+1) = exp1/exp2 - 1.0;
        end
        
        case 24
        % Test Problem CTP8
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2
        % # of constraints = 2
        for i=1:popsize
            theta = 0.1*PI;
            a = 40.0;
            b = 0.5;
            c = 1.0;
            d = 2.0;
            e = -2.0;
            g = 1.0 + xreal(i,2);
            pop(i,1) = xreal(i,1);
            pop(i,2) = g * (1.0 - sqrt(pop(i,1)/g));
            exp1 = (pop(i,2)-e) * cos(theta) - pop(i,1)*sin(theta);
            exp2 = (pop(i,2)-e) * sin(theta) + pop(i,1)*cos(theta);
            exp2 = b*PI*exp2^c;
            exp2 = abs(sin(exp2));
            exp2 = a*exp2^d;
            pop(i,nobj+1) = exp1/exp2 - 1.0;
            theta = -0.05*PI;
            a = 40.0;
            b = 2.0;
            c = 1.0;
            d = 6.0;
            e = 0.0;            
            exp1 = (pop(i,2)-e) * cos(theta) - pop(i,1)*sin(theta);
            exp2 = (pop(i,2)-e) * sin(theta) + pop(i,1)*cos(theta);
            exp2 = b*PI*exp2^c;
            exp2 = abs(sin(exp2));
            exp2 = a*exp2^d;
            pop(i,nobj+2) = exp1/exp2 - 1.0;
        end
     
        case 25
        % Test Problem CONSTR
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 2 
        % # of constraints = 2 
        Eps = 0.6;
        for i=1:popsize
            pop(i,1) = xreal(i,1);
            pop(i,2) = (1.0+xreal(i,2))/xreal(i,1); 
            pop(i,nobj+1) = (xreal(i,2)+9*xreal(i,1))/6.0 - 1.0; 
            pop(i,nobj+2) = -xreal(i,2) + 9*xreal(i,1) - 1.0;  
        end
        
        case 26
        % Test Problem CONSTR-EPSCONSTR
        % # of real variables = 2
        % # of bin variables = 0
        % # of objectives = 1, constraint on first objective (Set Eps)
        % # of constraints = 3, 3rd constr comes from eps-constriant approach
        Eps = 0.6;
        for i=1:popsize
            first = xreal(i,1);
            pop(i,1) = (1.0+xreal(i,2))/xreal(i,1); 
            pop(i,nobj+1) = (xreal(i,2)+9*xreal(i,1))/6.0 - 1.0; 
            pop(i,nobj+2) = -xreal(i,2) + 9*xreal(i,1) - 1.0;  
            pop(i,nobj+3) = (Eps - first)/Eps;
        end
        
        case 27
        % Test Problem DTLZ2
        % # of real variables = 7
        % # of bin variables = 0
        % # of objectives = 3
        % # of constraints = 0
        for i=1:popsize
            gg = 0.0;
            for j=nobj:nreal
                gg = gg + (xreal(i,j)-0.5)^2;
            end
            pop(i,1) = (1+gg)*cos(0.5*PI*xreal(i,2))*cos(0.5*PI*xreal(i,1));
            pop(i,2) = (1+gg)*cos(0.5*PI*xreal(i,2))*sin(0.5*PI*xreal(i,1)); 
            pop(i,3) = (1+gg)*sin(0.5*PI*xreal(i,2));
        end       
        
end

for i=1:popsize
    if (ncon == 0)
        pop(:,nobj+ncon+nreal+nbin+1) = 0.0;
        break
    else
        pop(i,nobj+ncon+nreal+nbin+1) = 0.0;
        for j=1:ncon
            if (pop(i,nobj+j) < 0.0)
                pop(i,nobj+ncon+nreal+nbin+1) = pop(i,nobj+ncon+nreal+nbin+1) + pop(i,nobj+j);
            end
        end
    end
end




