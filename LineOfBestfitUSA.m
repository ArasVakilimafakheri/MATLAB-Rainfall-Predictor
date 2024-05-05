x = UnitedStates(:,1);
y = UnitedStates(:,2);

% Plot the original data
figure(1);
plot(x, y, 'ro'); % 'ro' for red circles
hold on; % Keep the plot for adding more data

% Finding the line of best fit
p = polyfit(x, y, 1); % Linear fit (degree 1)

% Plot the line of best fit
xFit = linspace(min(x), max(x), 100);
yFit = polyval(p, xFit);
plot(xFit, yFit, 'b-'); % 'b-' for a blue line

% Predicting for the year 2021
year2021 = 2021;
predictedPrecipitation2021 = polyval(p, year2021);

% Plot the prediction for 2021
plot(year2021, predictedPrecipitation2021, 'g*'); % 'g*' for a green star

% Additional plot formatting
xlabel('Year');
ylabel('Annual Precipitation');
title('Annual Precipitation Data with Line of Best Fit');
legend('Data Points', 'Line of Best Fit', '2021 Prediction');

% Display the predicted precipitation for 2021
fprintf('Predicted average annual precipitation in the United States for the year 2021: %.2f inches\n', predictedPrecipitation2021);

% Creating a box plot
figure(2); % Creates a new figure
boxplot(y, x);

% Additional plot formatting
xlabel('Year');
ylabel('Annual Precipitation');
title('Box Plot of Annual Precipitation Over Years');
