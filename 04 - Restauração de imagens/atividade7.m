% limpar
clear; clc; close all;
% carregar imagem original
I = imread('original_pattern.tif');
% exibir a imagem original
figure, imshow(I),title('Imagem original - Fig. 5.3');
% aplicar ruído gaussiano
G = imnoise(I,'gaussian',0,0.01);
% exibir a imagem com ruído gaussiano
figure, imshow(G,[]),title('Imagem com ruído gaussiano');
% exibir histograma da imagem com ruído gaussiano
figure, imhist(G),title('Histograma da imagem com ruído gaussiano');
% aplicar ruído sal e pimenta
G = imnoise(I,'salt & pepper',0.05);
% exibir a imagem com ruído sal e pimenta
figure, imshow(G,[]),title('Imagem com ruído sal e pimenta');
% exibir histograma da imagem com ruído gaussiano
figure, imhist(G),title('Histograma da imagem com ruído sal e pimenta');