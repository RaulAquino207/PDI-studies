% limpar
clear; clc; close all;
% carregar pacote de imagem
pkg load image;
% criar imagens binárias
rows = 512;
cols = 512;
A = zeros(rows, cols);
B = zeros(rows, cols);
% desenhar elementos de frente
A(50:300,50:300) = 1;
B(200:450,200:450) = 1;
% exibir imagens binárias com elementos de frente
figure, imshow(A), title('A');
figure, imshow(B), title('B');
% aplicar operações lógicas
OU = A | B;
AND = A & B;
NOT = ~A;
XOR = xor(A,B);
% exibir resultados das operações lógicas
figure, imshow(OU), title('OU(A,B)');
figure, imshow(AND), title('AND(A,B)');
figure, imshow(NOT), title('NOT(A)');
figure, imshow(XOR), title('XOR(A,B)');