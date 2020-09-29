%Q2 - Fundamentos da imagem digital – parte 2
linhas = 100; colunas = 100;
A = zeros(linhas, colunas); B = zeros(linhas, colunas)
A(20:80, 40:60) = 1; B(20:70, 40:60) = 1;
XOR = xor(A,B);
subplot(1,3,1), imshow(A), title("Ótima"), subplot(1,3,2), imshow(B), title("Defeito"), subplot(1,3,3), imshow(XOR), title("Parte faltante")

%Q1 - Fundamentos da imagem digital – parte 3.
linhas = 512; colunas = 512;
A = zeros(linhas, colunas);
A(1:256,1:256) = 1;
B = ~A;
C = A | B;
subplot(1,3,1), imshow(A), title('A'), subplot(1,3,2), imshow(B), title('B'), subplot(1,3,3), imshow(C), title('C')
CountA = find(A == 1);
CountB = find(B == 11);
CountC = find(C == 1);
size(CountA), size(CountB), size(CountC)
ColorABC = zeros(linhas, colunas, 3);
ColorABC(:,:,1) = A;
imshow(ColorABC);
ColorABC(:,:,2) = B;
imshow(ColorABC);
ColorABC(:,:,3) = C;
imshow(ColorABC);
