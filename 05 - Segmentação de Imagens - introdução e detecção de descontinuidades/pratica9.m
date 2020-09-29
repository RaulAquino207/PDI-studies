% limpar
clear; clc; close all;
% carregar imagem original
I = im2double(imread('turbine_blade_black_dot.png'));
% exibir a imagem original
figure, imshow(I),title('Imagem original - Fig. 10.4(b)');
% máscara laplaciano Figura 10.4(a) - Gonzalez PDI 3a. ed.
h = [1 1 1; 1 -8 1; 1 1 1];
% aplicar laplaciano
L = imfilter(I, h);
% exibir resultado do laplaciano
figure, imshow(L),title('Laplaciano - Fig. 10.4(c)');
% calcular T
percent = 0.9;
T = max(abs(L(:)))*percent;
% aplicação do limiar T
L2 = false(size(L));
L2(L>=T) = true;
% exibir resultado do limiar T
figure, imshow(L2),title('Limiar T - Fig. 10.4(d)');