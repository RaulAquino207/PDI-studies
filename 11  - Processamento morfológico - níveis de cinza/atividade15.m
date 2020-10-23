I = imread('headCT-Vandy.png');
imshow(I);
se = strel("square", 3);
I2 = imdilate(I, se);
imshow(I2);
I3 = imerode(I, se);
imshow(I3);
I4 = I2 - I3;
imshow(I4);

Z = imread('rice.png');
imshow(Z);
T1 = graythresh(Z)
BW1 = im2bw(Z, T1);
imshow(BW1);
se = strel('disk',40,0);
Z2 = imopen(Z,se);
imshow(Z2);
Z3 = Z - Z2;
imshow(Z3);
T2 = graythresh(Z3)
BW2 = im2bw(Z3, T2);
imshow(BW2);

clear; clc; clear all;
H = imread('dark_blobs.png');
imshow(H);
%Fechamento
se1 = strel("octagon", 30);
H2 = imdilate(H, se1);
imshow(H2);
H3 = imerode(H2, se1);
imshow(H3);
%Abertura
se2 = strel("octagon", 60);
H4 = imerode(H3, se2);
imshow(H4);
H5 = imdilate(H4, se2);
imshow(H5);
se3 = strel("octagon", 3);
H6 = imerode(H5, se3);
H7 = H5 - H6;
imshow(H7);
H8 = H + H7;
imshow(H8);