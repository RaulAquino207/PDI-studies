% Limpar
clear; clc; close all;
% Carregar a imagem original
I = imread('grao_polen.bmp');
% Exibir a imagem
figure, imshow(I), title('Imagem original');
% Exibir o histograma para analisar a distribuição dos valores de intensidade
figure, imhist(I), title('Histograma da imagem original');
% Obter os valores mínimo e máximo de intensidade, calculando seus percentuais em relação ao valor máximo
min_i = min(min(I));
max_i = max(max(I));
min_i_perc = double(min_i) / 255;
max_i_perc = double(max_i) / 255;
% Alargar o contraste
I2 = imadjust(I,[min_i_perc max_i_perc],[0 1]);
% Exibir a imagem
figure, imshow(I2), title('Imagem ajustada');
% Exibir o histograma para analisar a distribuição dos valores de intensidade
figure, imhist(I2), title('Histograma da imagem ajustada');;

