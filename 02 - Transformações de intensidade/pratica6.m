% Limpar
clear; clc; close all;
% Carregar pacote de fun��es para imagens
pkg load image;
% Carregar a imagem original
I = imread('pout.tif');
% Exibir a imagem e seu histograma original
figure,
subplot(1,2,1), imshow(I), title('Imagem original')
subplot(1,2,2), imhist(I), title('Histograma original');
% Realizar a equaliza��o de histograma
J = histeq(I); % J = imagem equalizada
% Exibir a imagem equalizada e seu respectivo histograma
figure,
subplot(1,2,1), imshow(J), title('Imagem ap�s equaliza��o de histograma')
subplot(1,2,2), imhist(J), title('Histograma equalizado');
% Em Matlab � poss�vel obter a curva da fun��o de transforma��o:
% I = imread('pout.tif');
% [J, T] = histeq(I); % J = imagem equalizada, T = curva da fun��o de transforma��o
% figure, plot(T), title('Curva da fun��o de transforma��o');
% figure, plot((0:255)/255,T), title('Curva da fun��o de transforma��o [0,1]');
