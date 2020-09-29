% limpar
clear; clc; close all;
pkg load image;
pkg load statistics;
% imagens ruidosas
SALT = im2double(imread('circuit-board-salt-prob-pt1.tif'));
PEPPER = im2double(imread('circuit-board-pepper-prob-pt1.tif'));
GAUSS = im2double(imread('ckt-board-gauss-var-400.tif'));
UNIFORM = im2double(imread('ckt-uniform-var-800.tif'));
UNIFORM_PLUS_SALT_PEPPER = im2double(imread('ckt-uniform-plus-saltpepr-prob-pt1.tif'));
% funções
min_func = @(x) min(x(:));
max_func = @(x) max(x(:));
mean_func = @(x) mean(x(:));
median_func = @(x) median(x(:));
geomean_func = @(x) geomean(x(:));
harmmean_func = @(x) harmmean(x(:));
trimmean_func = @(x) trimmean(x(:),50);
midpoint_func = @(x) 0.5*(min(x(:))+max(x(:)));
wSize = 3;
w2Size = 5;
% SALT
SALTmin = nlfilter(SALT,[wSize wSize],min_func);
SALTmax = nlfilter(SALT,[wSize wSize],max_func);
SALTharmmean = nlfilter(SALT,[wSize wSize],harmmean_func);
figure(1),subplot(1,4,1), imshow(SALT), title('Original (ruído sal)');
figure(1),subplot(1,4,2), imshow(SALTmin), title('Min');
figure(1),subplot(1,4,3), imshow(SALTmax), title('Max');
figure(1),subplot(1,4,4), imshow(SALTharmmean), title('Harm mean');
% PEPPER
PEPPERmin = nlfilter(PEPPER,[wSize wSize],min_func);
PEPPERmax = nlfilter(PEPPER,[wSize wSize],max_func);
figure(2),subplot(1,3,1), imshow(PEPPER), title('Original (ruído pimenta)');
figure(2),subplot(1,3,2), imshow(PEPPERmin), title('Min');
figure(2),subplot(1,3,3), imshow(PEPPERmax), title('Max');
% GAUSS
GAUSSmean = nlfilter(GAUSS,[wSize wSize],mean_func);
GAUSSmedian = nlfilter(GAUSS,[wSize wSize],median_func);
GAUSSgeomean = nlfilter(GAUSS,[wSize wSize],geomean_func);
figure(3),subplot(1,4,1), imshow(GAUSS), title('Original (ruído gaussiano)');
figure(3),subplot(1,4,2), imshow(GAUSSmean), title('Mean');
figure(3),subplot(1,4,3), imshow(GAUSSmedian), title('Median');
figure(3),subplot(1,4,4), imshow(GAUSSgeomean), title('Geomean');
% UNIFORM
UNIFORMmidpoint = nlfilter(UNIFORM,[wSize wSize],midpoint_func);
figure(4),subplot(1,2,1), imshow(UNIFORM), title('Original (ruído uniforme)');
figure(4),subplot(1,2,2), imshow(UNIFORMmidpoint), title('Mid point');
% UNIFORM PLUS SALT PEPPER
UNIF_SALT_PEPPERtrimmean = nlfilter(UNIFORM_PLUS_SALT_PEPPER,[w2Size w2Size],trimmean_func);
figure(5),subplot(1,2,1), imshow(UNIFORM_PLUS_SALT_PEPPER), title('Original (ruído uniforme + sal + pimenta)');
figure(5),subplot(1,2,2), imshow(UNIF_SALT_PEPPERtrimmean), title('Trim mean');