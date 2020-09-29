A = imread('square_g.png');
pkg load image;
A1 = histeq(A);
figure, subplot(1,2,1), imshow(A), title('original'),
subplot(1,2,2), imshow(A1), title('equalização global');

A2 = double(A);
N = [3 3];
K = 0.5;
M = mean2(A2);
E1 = colfilt(A2, N, 'sliding', @std);
E2 = colfilt(A2, N, 'sliding', @mean);
E3 = K*M./E1;
E4 = E3.*(A2 - E2) + E2;
figure, subplot(1,2,1), imshow(A), title('original'),
subplot(1,2,2), imshow(E4, []), title('equalização local');

Z = [0 0 1 1 2
1 2 3 0 1
3 3 2 2 0
2 3 1 0 0
1 1 3 2 2]

Z1 = mean2(Z)
Z2 = var(Z)
Z1,Z2