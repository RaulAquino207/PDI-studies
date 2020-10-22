% limpar variáveis
clear; clc; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% extração de fronteiras
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% carregar imagem
I = imread('circles.png');
% demonstrar a extração de fronteiras
se = [1 1 1; 1 1 1; 1 1 1]; % elemento estruturante
EF = imerode(I,se);
EF = I - EF;
% mostrar comparativo
figure,
subplot(1,2,1), imshow(I), title('Original'),
subplot(1,2,2), imshow(EF), title('Extração de fronteiras');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% preenchimento de buracos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% carregar imagem
I2 = logical(imread('region-filling-reflections.tif'));
% demonstrar o preenchimento de buracos
%PB = bwmorph(I2,'fill');
PB = imfill(I2,'holes');
% mostrar comparativo
figure,
subplot(1,2,1), imshow(I2), title('Original'),
subplot(1,2,2), imshow(PB), title('Preenchimento de buracos');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% componentes conectados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% carregar imagem
I3 = imread('text.png');
% mostrar imagem original
figure, imshow(I3), title('Original');
% extrair componentes conectados
CC = bwconncomp(I3);
% exibir conteúdo
CC.Connectivity
CC.NumObjects
CC.ImageSize
CC.Connectivity
CC.PixelIdxList{1,1}
% determinar qual o maior componente e apagá-lo da imagem
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
AUX = I3;
AUX(CC.PixelIdxList{idx}) = 0;
% mostrar comparativo
figure,
subplot(1,2,1), imshow(I3), title('Original'),
subplot(1,2,2), imshow(AUX), title('Maior CC removido');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fecho convexo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% carregar imagem
I4 = [0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 1 1 1 0 0 0 0 0;
    0 0 1 1 1 1 1 0 0 0 0;
    0 0 1 1 1 1 0 0 0 0 0;
    0 0 0 0 1 1 0 1 0 0 0;
    0 0 0 0 1 1 0 1 0 0 0;
    0 0 0 0 1 1 1 0 0 0 0;
    0 0 0 0 0 0 1 0 0 0 0;
    0 0 0 0 0 0 1 0 0 0 0;
    0 0 0 0 0 1 1 0 0 0 0;
    0 0 0 0 0 1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0];
% obter convex hull
stats = regionprops(I4,'ConvexImage','ConvexHull','ConvexArea');
% Valores
stats.ConvexArea
stats.ConvexHull
% mostrar comparativo
figure,
subplot(1,2,1), imshow(I4), title('Original'),
subplot(1,2,2), imshow(stats.ConvexImage), title('Convex Hull');