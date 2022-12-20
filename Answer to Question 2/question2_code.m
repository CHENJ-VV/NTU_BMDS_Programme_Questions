%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solve the differential equation
timespan = [0, 1.5];
x0 = [1, 10, 0, 0];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Using MATLAB's own function ode45 to solve differential equations
% The usage of ode45 derives from the code posted on the website below：
% https://www.zhihu.com/question/395096211/answer/1227935749
[T, X] = ode45(@f, timespan, x0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot Figures of E, S, ES, and P respectively
figure;
plot(T, X(:, 1))
title('Plot for E');
ylabel('E'); xlabel('Time');

figure;
plot(T, X(:, 2))
title('Plot for S');
ylabel('S'); xlabel('Time');

figure;
plot(T, X(:, 3))
title('Plot for ES');
ylabel('ES'); xlabel('Time');

figure;
plot(T, X(:, 4))
title('Plot for P');
ylabel('P'); xlabel('Time');

V=150*X(:, 3);
    
figure;
plot(X(:,2),V)
title('Relationship between S and V')
xlabel('S'); ylabel('V')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function defination
function f = f(t, x)
 
    f = zeros(4, 1);
    
    % system of four differetial equations
    f(1) =750 * x(3) - 100 * (x(1) - x(3)) * x(2);
    f(2) =600 * x(3) - 100 * (x(1) - x(3)) * x(2);
    f(3) =100 * (x(1) - x(3)) * x(2) - 750 * x(3);
    f(4) =150 * x(3) ;    
end