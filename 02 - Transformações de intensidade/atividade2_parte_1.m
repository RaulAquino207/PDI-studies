clear; clc; clear all;
pkg load image;
I = imread('breast.tif');
I2 = imcomplement(I); 
figure,
subplot(1,2,1), imshow(I), title("Original")
subplot(1,2,2), imshow(I2), title("Negativo")

Z = imread('dft.tif');
Z2 = double(1*log10(1 + Z));
figure,
subplot(1,2,1), imshow(Z), title('Original');
subplot(1,2,2), imshow(Z2, []), title('Log');

X = imread('imagem_aerea.png');
X1 = double(X);
X2 = 1*X1.^3;
X3 = 1*X1.^4;
X4 = 1*X1.^5;
figure,
subplot(1,2,1), imshow(X), title('Original')
subplot(1,2,2), imshow(X2, []), title('Potencia ³');
figure,
subplot(1,2,1), imshow(X3, []), title('Potencia ⁴')
subplot(1,2,2), imshow(X4, []), title('Potencia ⁵');