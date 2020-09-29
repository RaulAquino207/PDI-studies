clear; clc; clear all;
pkg load image;
A = imread('figura_1a.png');
B = imread('figura_1b.png');
%figure, 
%subplot(1,2,1), imshow(A), title('figura 1(a)'),
%subplot(1,2,2), imshow(B), title('figur 1(b)');
C = A & B;
D = A | B;
E = ~C;
%figure, imshow(C), title('A AND B');
%figure, imshow(D), title('A OR B');
%figure, imshow(E), title('NOT(A AND B)');

H = imread('figura_2a.png');
H1 = imread('figura_2b.png');
figure,
subplot(1,2,1), imshow(H), title('original 2a'),
subplot(1,2,2), imshow(H1), title('original 2b');

figure,
subplot(1,2,1), imhist(H), title('hist 2a'),
subplot(1,2,2), imhist(H1), title('hist 2b');
h3 = fspecial('average',3);
H2 = imfilter(H, h3);
H3 = imfilter(H1, h3);

figure,
subplot(1,2,1), imhist(H2), title('hist média 2a'),
subplot(1,2,2), imhist(H3), title('hist média 2b');

I = imread('ckt-board-saltpep-prob.pt05.tif');
h5 = fspecial('average',5);
I2 = imfilter(I, h5);
%figure,
%subplot(1,2,1), imshow(I), title('original'),
%subplot(1,2,2), imshow(I2), title('aplicação da média 5x5');

I3 = medfilt2(I, [5 5]);
%figure,
%subplot(1,2,1), imshow(I), title('original'),
%subplot(1,2,2), imshow(I3), title('aplicação da mediana 5x5');