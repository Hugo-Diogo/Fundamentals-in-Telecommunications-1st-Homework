%choose the center frequency
f = input('Frequency: ');
%Choose the emission power (23dBm if it is WiFi 5G)
emission = input('Emission power (dBm): ')



%output power
P = @(x) emission - 30 - (92.4 + 20 * log10(f) + 20 * log10(x / 1000));



N = input("Number of measures: ");

x = []; %distances vector
y1 = []; %the average of the given values

%for each distance write five values
for i = 1:N
    som = 0;
    %here the values of the dstances ares going to be stored
    dist = input(sprintf('%d -> Distance in meters: ', i));
    x = [x, dist];
    for j = 1:5
        %here the five values are going to be summed 
        som = som + input(sprintf('%d -> value nº%d: ', i, j));
    end
    %here the algorithm will average the values and store the values
    som = (som / 5) - 30;
    y1 = [y1, som];
   
end

%here the function of the theoretical values will be created as y2
y2 = P(x);

%Empirical regression
p = polyfit(x, y1, 5);   % the value 5 was choosen to best fit the points
y1_fit = polyval(p, x);  % evaluates the polynomial function

error = y1_fit - y2;


figure(1)
hold on 
xlim([x(1) x(N)])
plot(x, y1, 'ro') %Empirical Data
plot(x, y1_fit, 'r') %Empirical Regression
plot(x, y2, 'b') %Theoretical
plot(x, error, 'k') %Error
xlabel('Distance (m)')
ylabel('P(dB)')
legend('Empirical Data', 'Empirical Regression', 'Theoretical', 'Error', 'Location', 'best') %The last two inputs sets the discription at the best place

saveas(gcf, 'graphic.png')


