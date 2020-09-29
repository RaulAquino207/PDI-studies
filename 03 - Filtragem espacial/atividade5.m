clear; clc; clear all;
pkg load image;
I = imread('dip-xe.png');
h = fspecial('average',3);
I2 = imfilter(I, h);
%figure, 
%subplot(1,2,1), imshow(I), title('original (a)'),
%subplot(1,2,2), imshow(I2), title('imagem suavizada (b)');
h1 = [0 1 0; 1 -4 1; 0 1 0];
I3 = imfilter(double(I2), h1);
I3_a = I3;
I3_a = I3 + abs(min(min(I3_a)));
I4 = double(I) - I3_a;
%figure, 
%subplot(1,2,1), imshow(I3_a, []), title('máscara de nitidez (c)'),
%subplot(1,2,2), imshow(I4, []), title('resultado da máscara (d)');
k = 2;
I5 = I + k*I4;
%figure, 
%subplot(1,2,1), imshow(I), title('original (a)'),
%subplot(1,2,2), imshow(I5), title('high-boost (e)');

L = imread('contact_lens_original.tif');
L2 = double(imgradient(L));

figure,
subplot(1,2,1), imshow(L), title('original'),
subplot(1,2,2), imshow(uint8(L2), []), title('operadores de Sobel');