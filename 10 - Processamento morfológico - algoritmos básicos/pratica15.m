% limpar variáveis
clear; clc; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% afinamento
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% carregar imagem
I = imread('circles.png');
% demonstrar o afinamento
THIN = bwmorph(I,'thin',Inf); % Inf = repete até que a imagem não mude mais
% mostrar comparativo
figure,
subplot(1,2,1), imshow(I), title('Original'),
subplot(1,2,2), imshow(THIN), title('Afinamento');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% espessamento
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% demonstrar o espessamento na imagem afinada
THICKEN = bwmorph(double(THIN),'thicken');
figure,
subplot(1,2,1), imshow(THIN), title('Imagem após afinamento'),
subplot(1,2,2), imshow(THICKEN), title('Espessamento');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% esqueletos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% carregar imagem
I = imread('circles.png');
% demonstrar o afinamento
SKEL = bwmorph(I,'skel',Inf); % Inf = repete até que a imagem não mude mais
% mostrar comparativo
figure,
subplot(1,2,1), imshow(I), title('Original'),
subplot(1,2,2), imshow(SKEL), title('Esqueleto');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% poda
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% carregar imagem
I = [0  0  0  0
	0  0  0  0 
	0  0  1  0
	0  1  0  0
	1  1  0  0 ];
% demonstrar a poda
SPUR = bwmorph(I,'spur');
% mostrar comparativo
figure,
subplot(1,2,1), imshow(I), title('Original'),
subplot(1,2,2), imshow(SPUR), title('Poda');