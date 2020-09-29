% limpar
clear; clc; close all;
pkg load image;
% carregar imagem original
I = imread('wirebond_mask.png');
% máscara laplaciano Figura 10.4(a) - Gonzalez PDI 3a. ed.
h = [1 1 1; 1 -8 1; 1 1 1];
% aplicar laplaciano
L = imfilter(double(I), h);
% laplaciano com valores absolutos
Labs = abs(L);
% laplaciano somente com valores positivos
Lpos = L;
Lpos(Lpos<0) = 0;
% exibir imagens
figure(1), imshow(I),title('Imagem Original - Fig. 10.5(a)');
figure(2), imshow(L,[]),title('Laplaciano Aj. - Fig. 10.5(b)');
figure(3), imshow(Labs),title('Laplaciano Val. Abs. - Fig. 10.5(c)');
figure(4), imshow(Lpos),title('Laplaciano Val. Pos. - Fig. 10.5(d)');
% máscara laplaciano Figura 10.6(b) - Gonzalez PDI 3a. ed.
h2 = [2 -1 -1; -1 2 -1; -1 -1 2];
% aplicar laplaciano
L2 = imfilter(double(I), h2);
% imagens ampliadas
L2corner_upleft = L2(1:100,1:100);
L2corner_downright = L2(size(I,1)-100:size(I,1),size(I,2)-100:size(I,2));
% laplaciano somente com valores positivos
Lpos2 = L2;
Lpos2(Lpos<0) = 0;
% laplaciano com maior valor positivo encontrado
Lbig = false(size(Lpos2));
maxValue = max(Lpos2(:));
Lbig(Lpos2==maxValue) = true;
% exibir imagens
figure(5), imshow(I),title('Imagem Original - Fig. 10.7(a)');
figure(6), imshow(L2,[]),title('Laplaciano Ajustado - Fig. 10.7(b)');
figure(7), imshow(imresize(L2corner_upleft,size(I)),[]),title('Vista Ampliada 1 - Fig. 10.7(c)');
figure(8), imshow(imresize(L2corner_downright,size(I)),[]),title('Vista Ampliada 2 - Fig. 10.7(d)');
figure(9), imshow(Lpos2),title('Valores positivos - Fig. 10.7(e)');
figure(10), imshow(Lbig),title('Valor máximo - Fig. 10.7(f)');