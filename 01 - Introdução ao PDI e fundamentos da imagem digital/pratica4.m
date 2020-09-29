% Este arquivo utiliza os resultados produzidos pelo script pratica3.m
pratica3
% Criar imagem com 3 canais de cores
COLOR = zeros(rows,cols,3);
% Manipular cada canal individualmente
COLOR(:,:,1) = XOR;
figure, imshow(COLOR), title('Canal R modificado');
COLOR(:,:,2) = XOR;
figure, imshow(COLOR), title('Canais R e G modificados');
COLOR(:,:,3) = XOR;
figure, imshow(COLOR), title('Canais R, G e B modificados');
% Incluir AND(A,B) em vermelho na imagem
AUX = COLOR(:,:,1);
AUX(AND==1) = 1;
COLOR(:,:,3) = AUX;
figure, imshow(COLOR), title('Inclusão do AND(A,B) em vermelho');
