f = 5.540;
%f = input('Frequency': );


%Output power
P = @(x) 23 - 30 - (92.4 + 20 * log10(f) + 20 * log10(x / 1000));



N = input("Número de medições: ");

x = []; %distances vector
y1 = []; %given values

for i = 1:N
    som = 0;
    dist = input(sprintf('%d -> Distance in meters: ', i));
    x = [x, dist];
    for j = 1:5
        som = som + input(sprintf('%d -> value nº%d: ', i, j));
    end
    som = (som / 5) - 30;
    y1 = [y1, som];
   
end

y2 = P(x);
erro = y2 - y1;
erro2 = y1 - y2;
figure(1)
hold on
xlim([x(1) x(N)])
plot(x, y1, 'r')
plot(x, y2, 'b')
plot(x, erro, 'k')
xlabel('Distance (m)')
ylabel('P(dB)')
legend('Empirical', 'Theoretical', 'Error')
saveas(gcf, 'graphic.png')


# Fundamentals-in-Telecommunications-1st-Homework
