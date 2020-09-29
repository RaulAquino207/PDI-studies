% Limpar
clear; clc; close all;
% Carregar pacote de funções para imagens
pkg load image;
% Carregar a imagem original
I = imread('pout.tif');
% Exibir a imagem e seu histograma original
figure,
subplot(1,2,1), imshow(I), title('Imagem original')
subplot(1,2,2), imhist(I), title('Histograma original');
% Realizar a equalização de histograma
J = histeq(I); % J = imagem equalizada
% Exibir a imagem equalizada e seu respectivo histograma
figure,
subplot(1,2,1), imshow(J), title('Imagem após equalização de histograma')
subplot(1,2,2), imhist(J), title('Histograma equalizado');
% Em Matlab é possível obter a curva da função de transformação:
% I = imread('pout.tif');
% [J, T] = histeq(I); % J = imagem equalizada, T = curva da função de transformação
% figure, plot(T), title('Curva da função de transformação');
% figure, plot((0:255)/255,T), title('Curva da função de transformação [0,1]');
