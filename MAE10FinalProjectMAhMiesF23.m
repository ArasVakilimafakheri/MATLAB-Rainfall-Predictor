% Final Project for ENGRMAE10 by Matlab with the MAhMies
clf
clc
clear
load('RainFall_DataSet_3.mat');
% Loading in the Dataset 
% The average annual precipitation of five countries for each year 2000-2020

% Assignment of variables that can be used for calculations for the Data

USvecy = UnitedStates(:,2); %Creates a vector for the avg. annual rainfall
USvecx = UnitedStates(:,1); %Creates a vector for years (2000-2020)

Jvecy = Japan(:,2); %Repeat for all countries
Jvecx = Japan(:,1); 

UKvecy = UnitedKingdom(:,2);
UKvecx = UnitedKingdom(:,1);

Ivecy = India(:,2);
Ivecx = India(:,1);

SAvecy = SaudiArabia(:,2);
SAvecx = SaudiArabia(:,1);

LatUS =  37.09024;   %For figure 5, latitude and longitudes in degrees
LongUS = -95.712891; %of the geographical center of each country.

LatIndia = 20.593684; %Repeat for all countries
LongIndia = 78.96288;

LatJap = 36.204824;
LongJap = 138.252924;

LatSA = 23.885942;
LongSA = 45.079162;

LatUK = 55.378051;
LongUK = -3.435973;

% Creation of variables that can be used without fail in the later series
% of if statements that call on the local function
usa = "usa";
japan = "japan";
uk = "uk";
india = "india";
sa = "sa";

% Display's the introductory prompt for the entire Modular Program, and aks
% for the user's input of country
fprintf("Welcome! This is an average annual rainfall calculator.\n" + ...
    "This calculator can help you evaluate the weather in some countries and decide which one you want to visit.\n" + ...
    "Created by: Miki, Aras, and Matthew\n\n")

choice = input("Please select a country: USA, Japan, Saudi Arabia(input 'SA'), India, or the United Kingdom(input 'UK')\n","s");
lowcase = lower(choice); % Changes the user input to all lower case letters

% Series of if statements that call on the local function based on the
% user-defined country
if lowcase == usa
    datamean(USvecy,USvecx,LatUS,LongUS); 
elseif lowcase == japan
    datamean(Jvecy,Jvecx,LatJap,LongJap);
elseif lowcase == uk
    datamean(UKvecy,UKvecx,LatUK,LongUK);
elseif lowcase == india
    datamean(Ivecy,Ivecx,LatIndia,LongIndia);
elseif lowcase == sa
    datamean(SAvecy,SAvecx,LatSA,LongSA);
else 
    fprintf("Please select a valid country\n")
end

%Function below calculates the mean of the rainfall data, as well as graphs
%5 different functions for the selected country
%1 is the the data shown in a bar graph, 2 is a line of best fit useed to 
%predict the next year's rainfall
%3 is a histogram of the data, 4 is a boxplot showing the extrema of the
%data, and 5 shows where the country is geographically, along with the
%average rainfall.
function output = datamean(vecy,vecx, lat, long) %input variables for plotting various figures...
output = mean(vecy); %...and calculating the mean rainfall.
fprintf("The average rainfall for the selected country is %.1f inches per year\n",output);

if output < 10 %10 inches is an agreeably small amount of rain
    disp("If you really don't like rain, then this country is for you!")
elseif output < 40 %40 is roughly the median rainfall between all the countries
    disp("If you enjoy more temperate weather, then this country is for you!")
else %Anything above 40 we consider a larger amount of rain
    disp("If you love the rain, then this country is for you!")
end

figure(1) % Creates a new figure
x = 0:length(vecy)-1; %bar graph of the data
y = vecy;
bar(x,y,"blue") %"blue" for blue bars
xlabel("Year (20XX)") %graph starts at 0 but means 2000, then 2001, etc.
ylabel("Rainfall (inches)")
title("Rainfall per year of selected country (2000-2020)")
ylim([0 80]) %When you run the script multiple times, its easier to see the
%difference between rainfalls with a set limit.

% Plot the original data
figure(2) % Creates a new figure
plot(vecx, vecy, 'ro'); % 'ro' for red circles
hold on; % Keep the plot for adding more data

% Finding the line of best fit
p = polyfit(vecx, vecy, 1); % Linear fit (degree 1)

% Plot the line of best fit
xFit = linspace(min(vecx), max(vecx), 100);
yFit = polyval(p, xFit);
plot(xFit, yFit, 'b-'); % 'b-' for a blue line

% Predicting for the year 2021
year2021 = 2021;
predictedPrecipitation2021 = polyval(p, year2021);

% Plot the prediction for 2021
plot(year2021, predictedPrecipitation2021, 'g*'); % 'g*' for a green star
hold off

% Additional plot formatting
xlabel('Year');
ylabel('Annual Precipitation');
title('Annual Precipitation Data with Line of Best Fit');
legend('Data Points', 'Line of Best Fit', '2021 Prediction');


figure(3) % Creates a new figure
nbins = 21;%number of data inputs
histogram(vecy, nbins); %histogram of the selected data

% Additional plot formatting
xlabel('Annual Precipitation (Inches)');
ylabel('Frequency');
title('Histogram of Annual Precipitation');

figure(4); % Creates a new figure
boxplot(vecy, 'orientation','horizontal') % Boxplot of the precipitation data

%Additional plot formatting
xlabel('Annual Precipitation (Inches)')
title('BoxPlot of the Annual preciputation')

figure(5); % Creates a new figure
geobubble(lat,long,output,"MapLayout","maximized") 
%Location of country using lat and long variables

% Display the predicted precipitation for 2021
fprintf('Predicted average annual precipitation in the selected country for the year 2021: %.2f inches\n', predictedPrecipitation2021);
end

