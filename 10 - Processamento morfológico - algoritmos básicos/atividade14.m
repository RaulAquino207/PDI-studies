I = imread('licoln_from_penny.tif');
imshow(I);
se = strel("square", 3);
I2 = erode(I, se);]
imshow(I2);
I3 = I - I2;
imshow(I3);
figure,
subplot(1,2,1), imshow(I), title('original'),
subplot(1,2,2), imshow(I3), title('resultado');

Z = imread('coins.png');
imshow(Z);
T1 = graythresh(Z)
BW1 = im2bw(Z, T1);
figure,
subplot(1,2,1), imshow(Z), title('original'),
subplot(1,2,2), imshow(BW1, title('limiarização');
PB = imfill(BW1, 'holes');
imshow(PB);
figure,
subplot(1,2,1), imshow(BW1), title('limiarização'),
subplot(1,2,2), imshow(PB, title('preenchimento');

H = imread('lung_seg.png');
PB1 = imfill(H, 'holes');
imshow(PB1);
CC = bwconncomp(PB1);
CC.NumObjects
numPixels = cellfun(@numel, CC.PixelIdxList);
[smallest, idx] = min(numPixels);
AUX = PB1;
AUX(CC.PixelIdList{idx}) = 0;
figure,
subplot(1,2,1), imshow(H), title('original'),
subplot(1,2,2), imshow(AUX), title('sem traqueia');