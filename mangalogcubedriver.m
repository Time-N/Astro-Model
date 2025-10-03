% Driver file for mangalogcube to generate N plots of evenly spaced
% wavelengths.

N=36; % Number of subplots (must be square)

dw = -(3.6216e+03 - 7.4258e+03)/N; % change in wavelength

for n = 1:N
    subplot(sqrt(N),sqrt(N),n)
    w1 = 3.6216e+03 + dw*(n-1);
    w2 = 3.6216e+03 + dw*n;
    mangalogcube
    hold on;
end
hold off


%{
subplot(2,2,1);
w1=3000;
w2=8000;
mangalogcube;
hold on;

subplot(2,2,2);
w1=5000;
w2=5250;
mangalogcube;

subplot(2,2,3);
w1=0;
w2=4000;
mangalogcube;

subplot(2,2,4);
w1=6730;
w2=7850;
mangalogcube;
hold off
%}