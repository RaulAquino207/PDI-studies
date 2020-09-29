clear; clc; clear all;
pkg load image;
E = imread('escura.tif');
C = imread('clara.tif');
B = imread('baixo_contraste.tif');
figure,
subplot(1,2,1), imshow(E), title('Escura'),
subplot(1,2,2), imhist(E), title('Histograma');
figure,
subplot(1,2,1), imshow(C), title('Clara'),
subplot(1,2,2), imhist(C), title('Histograma');
figure,
subplot(1,2,1), imshow(B), title('Baixo contraste'),
subplot(1,2,2), imhist(B), title('Histograma');

E2 = histeq(E);
C2 = histeq(C);
B2 = histeq(B);
figure,
subplot(1,2,1), imshow(E2), title('Escura equalizada'),
subplot(1,2,2), imhist(E2), title('Histograma');
figure,
subplot(1,2,1), imshow(C2), title('Clara equalizada'),
subplot(1,2,2), imhist(C2), title('Histograma');
figure,
subplot(1,2,1), imshow(B2), title('Baixo contraste equalizada'),
subplot(1,2,2), imhist(B2 ), title('Histograma');