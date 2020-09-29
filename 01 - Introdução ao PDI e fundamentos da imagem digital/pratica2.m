% limpar
clear; clc; close all;
% carregar pacote de imagem
pkg load image;
% carregar imagem pequena
Z = imread('lena154g.bmp');
% ampliar a imagem: vizinho mais próximo
Z2 = imresize(Z,3.33,'nearest');
% Ampliar a imagem: bilinear
Z3 = imresize(Z,3.33,'bilinear');
% Ampliar a imagem: bicúbica
Z4 = imresize(Z,3.33,'bicubic');
% Exibir ampliação vizinho mais próximo
figure,
subplot(1,2,1), imshow(Z), title("Original 154x154")
subplot(1,2,2), imshow(Z2), title("Nearest 513x513")
% Exibir ampliação bilinear
figure,
subplot(1,2,1), imshow(Z), title("Original 154x154")
subplot(1,2,2), imshow(Z3), title("Bilinear 513x513")
% Exibir ampliação bicúbica
figure,
subplot(1,2,1), imshow(Z), title("Original 154x154")
subplot(1,2,2), imshow(Z4), title("Bicubic 513x513")
% Comparar ampliação bicúbica e bilinear
figure,
subplot(1,2,1), imshow(Z3), title("Bilinear 513x513")
subplot(1,2,2), imshow(Z4), title("Bicubic 513x513")
Z5 = imresize(Z4,2,'bicubic');
figure,
subplot(1,2,1), imshow(Z4), title("Z4")
subplot(1,2,2), imshow(Z5), title("Z5")