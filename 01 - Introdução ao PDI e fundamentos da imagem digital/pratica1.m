% limpar
clear; clc; close all;
% carregar pacote de imagem
pkg load image;
% carregar imagem original
I = imread('lena512.bmp');
% exibir imagem original
figure, imshow(I);
% converter imagem colorida para tons de cinza
G = rgb2gray(I);
% exibir imagem tons de cinza
figure, imshow(G);
% máximos e mínimos da imagem tons de cinza
max(max(G))
min(min(G))
