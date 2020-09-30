% limpar variáveis
clear; clc; close all;
% carregar imagem ruidosa
I = imread('large_septagon_gaussian_noise_mean_0_std_50_added.png');
% obter o valor de limiar utilizando o método de Otsu
T1 = graythresh(I);
% limiarizar a imagem original com o T1 calculado
BW1 = im2bw(I,T1); % imbinarize(I,T1) no Matlab
% calcular o maior valor do histograma
[counts,~] = imhist(I);
maxValueHist = max(counts);
% exibir imagens
figure(1),
subplot(1,3,1), imshow(imresize(I,0.5)), title('Original ruidosa'),
subplot(1,3,2), imhist(I), ylim([0 maxValueHist]), title('Histograma'),
subplot(1,3,3), imshow(BW1), title('Segmentação');
% suavizar imagem ruidosa
h = fspecial('average',5);
G = imfilter(I,h);
% obter o novo valor de limiar utilizando o método de Otsu
T2 = graythresh(G);
% limiarizar a imagem suavizada com o T2 calculado
BW2 = im2bw(G,T2); % imbinarize(G,T2) no Matlab
% calcular o maior valor do histograma
[counts,~] = imhist(G);
maxValueHist = max(counts);
% exibir imagens
figure(2),
subplot(1,3,1), imshow(G), title('Suavizada'),
subplot(1,3,2), imhist(G), ylim([0 maxValueHist]), title('Histograma'),
subplot(1,3,3), imshow(BW2), title('Segmentação');