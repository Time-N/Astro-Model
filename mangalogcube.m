% Processes the manga-10001-12701-LOGCUBE.fits file and generates an
% image of a spectrum of wavelengths.
%
% To find manga-10001-12701-LOGCUBE.fits file go to 
% https://magrathea.sdss.org/marvin/galaxy/10001-12701/

info = fitsinfo('manga-10001-12701-LOGCUBE.fits');
cube = fitsread('manga-10001-12701-LOGCUBE.fits','Image',1);
wave = fitsread('manga-10001-12701-LOGCUBE.fits','binarytable',1);

hdr = info.Image(1).Keywords;

% Find the row index for each keyword
idx_crval3 = find(strcmp(hdr(:,1),'CRVAL3'));
idx_cdelt3 = find(strcmp(hdr(:,1),'CD3_3'));
idx_naxis3 = find(strcmp(hdr(:,1),'NAXIS3'));

% Extract numeric values safely
crval3 = hdr{idx_crval3,2};
cdelt3 = hdr{idx_cdelt3,2};
naxis3 = hdr{idx_naxis3,2};

%w1=3000;
%w2=4000;

% Compute the full wavelength array
wave_full_log = crval3:0.8339:crval3+(size(cube,3)-1)*0.8339;

% Find the corresponding indicies to real wavelength range in angstrom
w_indices = find(wave_full_log >= (w1) & wave_full_log <=(w2));

% Extract that range
subcube = cube(:, :, w_indices);
narrowband_image = squeeze(sum(subcube,3));
imagesc(narrowband_image);
colormap(jet);
axis image;
colorbar;
title(sprintf('Sum over wavelengths %d-%d', w1, w2))