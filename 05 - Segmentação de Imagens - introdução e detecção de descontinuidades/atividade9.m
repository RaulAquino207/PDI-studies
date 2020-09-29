% limpar
clear; clc; close all;
% carregar imagem original
I = im2double(imread('building_original.tif'));
% diminuir imagem para visualização no octave online
%I = imresize(I,0.5);
% aplicação do filtro da média
h = fspecial('average',5);
I2 = imfilter(I,h);
% máscaras
sobelX = [-1 -2 -1; 0 0 0; 1 2 1];
sobelY = [-1 0 1; -2 0 2; -1 0 1];
% aplicar máscaras
Gx = imfilter(I,sobelX);
Gy = imfilter(I,sobelY);
Gx2 = imfilter(I2,sobelX);
Gy2 = imfilter(I2,sobelY);
% gerar imagem do gradiente através de aproximação
G = abs(Gx) + abs(Gy);
G2 = abs(Gx2) + abs(Gy2);
% exibir imagens
figure(1), subplot(2,2,1), imshow(I), title('Original - Fig. 10.16(a)');
figure(1), subplot(2,2,2), imshow(Gx), title('Gx - Fig. 10.16(b)');
figure(1), subplot(2,2,3), imshow(Gy), title('Gy - Fig. 10.16(c)');
figure(1), subplot(2,2,4), imshow(G), title('G - Fig. 10.16(d)');
% exibir imagens
figure(2), subplot(2,2,1), imshow(I2), title('Original Filtrada - Fig. 10.18(a)');
figure(2), subplot(2,2,2), imshow(Gx2), title('Gx2 - Fig. 10.18(b)');
figure(2), subplot(2,2,3), imshow(Gy2), title('Gy2 - Fig. 10.18(c)');
figure(2), subplot(2,2,4), imshow(G2), title('G2 - Fig. 10.18(d)');
% calcular valor máximo do gradiente e definir threshold
maxValueG = max(G(:));
T = maxValueG * 0.3;
maxValueG2 = max(G2(:));
T2 = maxValueG2 * 0.3;
% criar imagens
GT1 = G;
GT2 = G2;
% aplicar limiar
GT1(G<T) = 0;
GT2(G2<T2) = 0;
GT1(G>=T) = 1;
GT2(G2>=T2) = 1;
% exibir imagens
figure(3), subplot(1,2,1), imshow(GT1,[]), title('GT1 - Fig. 10.20(a)');
figure(3), subplot(1,2,2), imshow(GT2,[]), title('GT2 - Fig. 10.20(b)');

% limpar
clear; clc; close all;
% carregar imagem original
I = imread('headCT-Vandy.png');
% aplicar filtro da média
h = fspecial('average',5);
I2 = imfilter(I,h);
% detectar bordas usando o gradiente
[G,~] = imgradient(I2);
% aplicação do limiar
maxValueG = max(G(:));
T = maxValueG * 0.15;
GT1 = false(size(G));
GT1(G>=T) = true;
% detectar bordas usando o LoG
LOG = edge(I2,'log',0.002,3);
% detectar bordas usando o canny
CANNY = edge(I2,'canny',[0.05 0.15],2);
% exibir imagens
figure, imshow(I), title('Original - Fig. 10.26(a)');
figure, imshow(GT1), title('GT1 - Fig. 10.26(b)');
figure, imshow(LOG), title('LoG - Fig. 10.26(c)');
figure, imshow(CANNY), title('Canny - Fig. 10.26(d)');