import cv2 as cv
import numpy as np
import math
import matplotlib.pyplot as plt

'''
Negativo da imagem:
a. Carregue a imagem breast.tif
b. Exiba a imagem original
c. Aplique a transformação negativo da imagem
d. Exiba o negativo da imagem

Transformação logarítmica:
f. Carregue a imagem dft.tif
h. Aplique a transformação logarítmica com c = 1 em todos os pixels da imagem (s = c log(1 + r))

Transformação de potência:
k. Carregue a imagem imagem_aerea.tif
l. Exiba a imagem original
m. Aplique as transformações de potência com c = 1 e gama igual a 3.0, 4.0 e 5.0
n. Exiba as imagens transformadas geradas
'''

breast = cv.imread('./dataset/breast.tif')
# cv.imshow('Original', breast)
# cv.waitKey(0)

breast_neg = cv.bitwise_not(breast)
# cv.imshow('Negativo', breast_neg)
# cv.waitKey(0)

dft = cv.imread('./dataset/dft.tif')
dft_gray = cv.cvtColor(dft, cv.COLOR_BGR2GRAY)
cv.imshow('Original', dft_gray)
cv.waitKey(0)

rows, cols = dft_gray.shape

dft_log = np.zeros((rows, cols), dtype=np.uint8)
for row in range(rows):
    for col in range(cols):
        dft_log[row, col] = 1* math.log(1 +  dft_gray[row, col])

hist = cv.calcHist(dft_log, channels=[0], mask=None, histSize=[256], ranges=[0, 256])
plt.hist(hist.ravel(), 256, [0, 256])
plt.show()
# cv.imshow('Log', dft_log)
# cv.waitKey(0)