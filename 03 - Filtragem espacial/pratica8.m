% limpar
clear; clc; close all;
% carregar imagem original
I = imread('blurry_moon.png');
% exibir a imagem original
figure, imshow(I),title('Imagem original - Fig. 3.38(a)');
% máscara laplaciano Figura 3.37(a) - Gonzalez PDI 3a. ed.
h1 = [0 1 0; 1 -4 1; 0 1 0];
% máscara laplaciano Figura 3.37(b) - Gonzalez PDI 3a. ed.
h2 = [1 1 1; 1 -8 1; 1 1 1];
% aplicar laplaciano h1
L1 = imfilter(double(I), h1);
% aplicar laplaciano h2
L2 = imfilter(double(I), h2);
% exibir laplaciano L1 (valores < 0 são convertidos para 0 na exibição)
figure, imshow(uint8(L1)), title('Laplaciano sem ajuste - Fig. 3.38(b)');
% ajustar L1 (somar o valor absoluto do mínimo a todos os pixels)
L1_a = L1;
L1_a = L1_a + abs(min(min(L1_a)));
% exibir laplaciano L1 ajustado (intervalo é reajustado para o intervalo 0 a 255)
figure, imshow(L1_a,[]), title('Laplaciano ajustado - Fig. 3.38(c)');
% gerar imagem aguçada com laplaciano L1
G1 = double(I) - L1; % + para coeficiente central positivo, - para negativo
% exibir imagem aguçada com laplaciano L1
figure, imshow(uint8(G1),[]), title('Imagem aguçada com máscara h1 - Fig. 3.38(d)');
% gerar imagem aguçada com laplaciano L2
G2 = double(I) - L2; % + para coeficiente central positivo, - para negativo
% exibir imagem aguçada com laplaciano L2
figure, imshow(uint8(G2),[]), title('Imagem aguçada com máscara h2 - Fig. 3.38(e)');