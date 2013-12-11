close all
p=0.25;
n = 1:100;

markov = 2*p*ones(size(n));
cheby = p*(1-p)./(n.*(0.5-p)^2);
hoeff = 2 * exp(-2*n*(0.5-p)^2);
exact = 1-binocdf(floor(0.5.*n-0.5), n, p);

figure
hold on
plot(n, markov, 'g', 'LineWidth', 2);
plot(n, cheby, 'r-', 'LineWidth', 1);
plot(n, hoeff, 'b-', 'LineWidth', 1);
plot(n, exact, 'k', 'LineWidth', 2);
axis([1 100 0 3])
xlabel('n samples')
ylabel('X_n')
title('Probability bounds');
xlabel('n samples')
ylabel('P(X_n >= 0.5)')
legend('markov', 'chebyshev',  'hoeffding', 'exact');

figure
hold on
plot(n, log(markov), 'g', 'LineWidth', 2);
plot(n, log(cheby), 'r-', 'LineWidth', 1);
plot(n, log(hoeff), 'b-', 'LineWidth', 1);
plot(n, log(exact), 'k', 'LineWidth', 2);
title('Semilogspace Probability bounds')
xlabel('n samples')
ylabel('log P(X_n >= 0.5)')
legend('markov', 'chebyshev',  'hoeffding', 'exact');

figure
hold on
plot(log(n), log(markov), 'g', 'LineWidth', 2);
plot(log(n), log(cheby), 'r-', 'LineWidth', 1);
plot(log(n), log(hoeff), 'b-', 'LineWidth', 1);
plot(log(n), log(exact), 'k', 'LineWidth', 2);
title('Logspace Probability Bounds')
xlabel('log n samples')
ylabel('log P(X_n >= 0.5)')
legend('markov', 'chebyshev',  'hoeffding', 'exact');

