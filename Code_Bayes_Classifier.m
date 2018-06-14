% Initialization              
DayBr=[];                                                         % Day Brightness Values
DayVa=[];                                                         % Day Variance Values
NightBr=[];                                                       % Night Brightness Values
NightVa=[];                                                       % Night Variance Values


% Read the images files and take the necessary values
for i=1:20                                                        % Operating System may have a different way to specify the location of files! This command is for windows.
    img_color = imread(['D:\day-night-images\n' num2str(i) '.jpg']);     % Path name and file name. All night images start with 'n' and ends with a number (n1, n2, ..., n20). All images are .jpg. 
    hsv_img = rgb2hsv(img_color);                                 % Conversion to hsv
    value = hsv_img(:,:,3);                                       % Take the 3rd layer
    brightness=mean(mean(value));                                 % As long as we have a 2 x 2 table we need to use nested functions
    NightBr=[NightBr,brightness];                                 % Save the value and do the same for the Variance
    Variance = var(var(value));
    NightVa=[NightVa,Variance];
end;    
for i=1:20
    img_color = imread(['D:\day-night-images\d' num2str(i) '.jpg']);     % All day images start with 'd' and ends with a number (d1, d2, ..., d20). All images are .jpg 
    hsv_img = rgb2hsv(img_color);
    value = hsv_img(:,:,3);
    brightness=mean(mean(value));
    DayBr=[DayBr,brightness];
    Variance = var(var(value));
    DayVa=[DayVa,Variance];
end;


% That step is optional and it limits decimal points to 1 (for example the number 5.65128 is being converted to 5.7)
round(NightVa,1);
round(NightBr,1);
round(DayVa,1);
round(DayBr,1);


% Make the 2D chart of Brightness Vs Frequency of Occurrence
figure                                                            % New figure. do not throw it away any previous one
histfit(DayBr)                                                    % Design a histogram with the frequency of occurrence of Day Brightness values
grid on                                                           % Design some lines for more accurate appearance 
hold all                                                          % Keep that histogram, do not throw it away if a new one will be added
histfit(NightBr)                                                  % Design a histogram with the frequency of occurrence of Night Brightness values
xlim ([0 1])                                                      % Limitate x label. Starts from 0 and ends to 1.
ylabel 'Frequency of Occurrence'                                  % Name the labels
xlabel 'Brightness'


% Make the 2D chart of Brightness Vs Variance (based on this chart we will count the 'x' signs per grid and add them to a csv file)
figure
plot(DayBr,DayVa,'x')                                             % Creates a 2D line plot of the data
grid on
hold all
plot(NightBr,NightVa,'x')
grid on
hold all
xlabel 'Brightness mean'
ylabel 'Brightness variance'


% Read the files that contains the Brightness per Variance values + the number of 'x' signs per grid
DAY = csvread('D:\day-night\DAY.csv'); 
NIGHT = csvread('D:\day-night\NIGHT.csv'); 


% Define collumns 
a=NIGHT(:,1);                                                     % Take the repetitively Brightness values
b=NIGHT(:,2);                                                     % Take the repetitively Variance values
c=NIGHT(:,3);                                                     % Take the number of 'x' signs 
d=DAY(:,1);
e=DAY(:,2);
f=DAY(:,3);


% Make the 3D chart
figure
load franke                                                       % Franke bivariate test function
sf = fit([a, b],c,'linear')                                       % Fit linear surface to data 
plot(sf,[a,b],c)                                                  % Creates a 3D plot of a set of data points
hold on
sf = fit([d, e],f,'linear')
plot(sf,[d,e],f)
xlabel 'Brightness Mean'
ylabel 'Brightness Variance'
zlabel 'Frequency of Occurrence'
hold off                                                          % Sets the hold state to off so that new plots added to the axes clear existing plots and reset all axes properties