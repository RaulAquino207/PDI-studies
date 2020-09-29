% limpar
clear; clc; close all;
% carregar pacote de imagem
pkg load image;
% carregar imagem corrompida pelo ruído sal e pimenta
I = imread('ckt_board_saltpep_prob_pt.tif');
% ou carregar uma imagem sem ruído e adicionar o ruído posteriormente
%I = imread('test_pattern_blurring_orig.tif');
%I = imnoise(I,'salt & pepper',0.1);
% exibir a imagem original
figure, imshow(I), title('Imagem original - corrompida pelo ruído sal e pimenta');
% gerar máscara 3 x 3 para o filtro da média
h = fspecial('average',3); % ou: h = ones(3,3) / 9;
% aplicar filtro da média com janela 3x3 na imagem original
S = imfilter(I, h);
% exibir a imagem filtrada pela média
figure, imshow(S), title('Imagem filtrada - Média 3 x 3');
% aplicar filtro da mediana com janela 3x3 na imagem original
Z = medfilt2(I,[3 3]);
% exibir a imagem filtrada pela mediana
figure, imshow(Z), title('Imagem filtrada - Mediana 3 x 3');
