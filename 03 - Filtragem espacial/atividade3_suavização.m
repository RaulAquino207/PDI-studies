pkg load image;
I = imread('test_pattern_blurring_orig.tif');
h3 = fspecial('average',3);
h5 = fspecial('average',5);
h9 = fspecial('average',9);
h15 = fspecial('average',15);
h35 = fspecial('average',35);
S3 = imfilter(I, h3);
S5 = imfilter(I, h5);
S9 = imfilter(I, h9);
S15 = imfilter(I, h15);
S35 = imfilter(I, h35);
figure,
subplot(1,2,1), imshow(I), title('original'),
subplot(1,2,2), imshow(S3), title('média 3x3');
figure,
subplot(1,2,1), imshow(S5), title('média 5x5'),
subplot(1,2,2), imshow(S9), title('média 9x9');
figure,
subplot(1,2,1), imshow(S15), title('média 15x15'),
subplot(1,2,2), imshow(S35), title('média 35x35');

Z3 = medfilt2(I, [3 3]);
Z5 = medfilt2(I, [5 5]);
Z9 = medfilt2(I, [9 9]);
Z15 = medfilt2(I, [15 15]);
Z35 = medfilt2(I, [35 35]);
subplot(1,2,1), imshow(I), title('original'),
subplot(1,2,2), imshow(Z3), title('mediana 3x3');
figure,
subplot(1,2,1), imshow(Z5), title('mediana 5x5'),
subplot(1,2,2), imshow(Z9), title('mediana 9x9');
figure,
subplot(1,2,1), imshow(Z15), title('mediana 15x15'),
subplot(1,2,2), imshow(Z35), title('mediana 35x35');