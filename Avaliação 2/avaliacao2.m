clear; clc; clear all; %limpeza 
pkg load image; %carregando pacote de imagem
wSize = 3; %para o tamanho da máscara
%carregando imagem com ruído de sal
S = imread('circuit-board-salt-prob-pt1.tif');
%carregando imagem com ruído de pimenta
P = imread('circuit-board-pepper-prob-pt1.tif');
%função para o mínimo
min_func = @(x) min(x(:));
%função para máximo
max_func = @(x) max(x(:));
%aplicando as máscaras nas imagens
%S2 = nlfilter(S, [wSize wSize], min_func);  
%S3 = nlfilter(S, [wSize wSize], max_func);
%P2 = nlfilter(P, [wSize wSize], min_func);
%P3 = nlfilter(P, [wSize wSize], max_func);
%mostrando os resultados
%figure, 
%subplot(1,2,1), imshow(S2), title('sal min_func'),
%subplot(1,2,2), imshow(S3), title('sal max_func');
%figure,
%subplot(1,2,1), imshow(P2), title('pimenta min_func'),
%subplot(1,2,2), imshow(P3), title('pimenta max_func');

function [thresh, quality] = multithresh (I, N = 1)
  if (nargin < 1 || nargin > 2)
    print_usage ();
  endif
  
  if (isrgb (I))
    I = rgb2gray (I);
  endif
  # Need convert the input in a histogram
  # we have a gray image or a histogram?
  if (isvector (I) && !issparse (I) && isreal (I) && all (I >= 0))
    H = I;
  else # make a histogram
    H = hist (I(:), 0:intmax (class (I)));
  endif
  
  # H is our histogram, need to make the divisions
  accumulative = cumsum (H);
  n_bins = length (H);
  total = accumulative(n_bins);
  accumulative_moment = cumsum ((1:n_bins) .* H);
  
  # Removing zero values to speed calculation and
  # remove possible division by zero
  zeros_values = find (H == 0);
  nonzeros_values = find (H != 0);
  accumulative = accumulative(nonzeros_values);
  accumulative_moment = accumulative_moment(nonzeros_values);
  n_bins = length (accumulative);
  
  # Testing if is wanted more regions than existing color levels
  if(N >= n_bins)
    warning (["multithresh.m: Warning there are " num2str(n_bins)
    " different colors (bins in Histogram), this number should be"
    " bigger than " N " N (number of divisions)"])
    thresh = 1:N;
    quality = 0;
    return;
  endif
  
  better = 0;
  better_combination = zeros (N, 1);
  mi_T = 0;
  for i = 1:length (H)
    mi_T += i * H(i);
  endfor
  
  combination = 1:N;
  
  # There are N + 1 classes
  w = zeros (N + 1, 1); # percentage of pixels in each class
  mi = zeros (N + 1, 1); # variance of pixels in each class
  while true
    # evaluate combination
    w(1) = accumulative(combination(1));
    mi(1) = accumulative_moment(combination(1)) / w(1);
    for i = 2:N
      w(i) = accumulative(combination(i)) - accumulative(combination(i - 1));
      mi(i) = (accumulative_moment(combination(i)) - accumulative_moment(combination(i - 1))) / w(i);
    endfor
    w(N + 1) = accumulative(end) - accumulative( combination(N) );
    mi(N + 1) = (accumulative_moment(end) - accumulative_moment( combination(N) ) ) / (w(N + 1));
    
    value = 0;
    for i = 1 : N + 1
      value += w(i) * (mi(i) - mi_T)**2;
    endfor
    
    if value > better
      better = value;
      better_combination = combination;
    endif
    
    # next combination
    # which thresholds we should update?
    upd = 0;
    for i = N:-1:1
      if combination(i) != n_bins - (N-i) - 1
        upd = i;
        break;
      endif
    endfor
    if upd == 0 # don't need to update anything, calculation is over
      break;
    endif
    combination(upd:end) = (combination(upd) + 1):(combination(upd) + 1 + (N - upd));
  endwhile
  
  for i = 1:length (better_combination)
    better_combination(i) += length (find (zeros_values <= better_combination(i)));
  endfor
  
  thresh = better_combination;
  
  if nargout() == 2
    # calculate the quality
    # eta = o_B**2 / o_T**2
    # o_T = (i - mi_T)**2 p_i
    n_bins = length (H);
    o_T2 = sum ((((1:n_bins) .- ones (1, n_bins).*mi_T ).^2) .* H );
    quality = better/o_T2;
  endif
endfunction

U = imread('circlesBrightDark.png');
limiar = graythresh(U);
U2 = im2bw(U,limiar);
U3 = im2bw(U, 158/255);
figure,
subplot(1,2,1), imshow(U2), title('a'),
subplot(1,2,2), imshow(U3), title('b');
    
Z = imread('circuit.png');
prewitX = [-1 -1 -1; 0 0 0; 1 1 1]
prewitY = [-1 0 1; -1 0 1; -1 0 1]
%Gx = im2double(imfilter(Z, prewitX));
%Gy = im2double(imfilter(Z, prewitY));
%G = abs(Gx) + abs(Gy);
%figure,
%subplot(1,2,1), imshow(Z), title('circuito original'),
%subplot(1,2,2), imshow(G), title('prewit');
%T = graythresh(G)
%R = im2bw(G, T1);
%figure,
%subplot(1,2,1), imshow(Z), title('circuito original'),
%subplot(1,2,2), imshow(R), title('limiarizado');