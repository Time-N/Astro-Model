% Processes the platelist.fits file and displays number
% of quasars, galaxies, and stars on the y axis and the
% plate number on the x axis.
info = fitsinfo('platelist.fits');
disp(info);
data = fitsread('platelist.fits', 'BINTABLE');
plate = data{1};
chunk = data{18};
N_guide = data{65};
N_total = data{88};
N_galaxy = data{89};
N_quasar = data{90};
N_star = data{91};
N_unknown = data{92};
N_sky = data{93};
Q_comments = data{108};
scatter(plate,N_galaxy,'r','filled');
hold on
scatter(plate,N_quasar,'g','filled');
scatter(plate,N_star,'b','filled');
legend('Ngalaxy','Nquasar','Nstar')
hold off