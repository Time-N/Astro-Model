info = fitsinfo('platelist.fits');
disp(info);
data = fitsread('platelist.fits', 'BINTABLE');
plate = data{1};
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