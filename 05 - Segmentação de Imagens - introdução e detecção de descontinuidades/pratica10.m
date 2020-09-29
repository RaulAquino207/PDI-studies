% limpar
clear; clc; close all;
% carregar imagem original
I = im2double(imread('building_original.tif'));
% máscaras
sobelX = [-1 -2 -1; 0 0 0; 1 2 1];
sobelY = [-1 0 1; -2 0 2; -1 0 1];
% aplicar máscaras
Gx = imfilter(I,sobelX);
Gy = imfilter(I,sobelY);
% gerar imagem do gradiente através de aproximação
G = abs(Gx) + abs(Gy);
% exibir imagens
figure(1), subplot(2,2,1), imshow(I), title('Original - Fig. 10.16(a)');
figure(1), subplot(2,2,2), imshow(Gx), title('Gx - Fig. 10.16(b)');
figure(1), subplot(2,2,3), imshow(Gy), title('Gy - Fig. 10.16(c)');
figure(1), subplot(2,2,4), imshow(G), title('G - Fig. 10.16(d)');