import cv2 as cv
import numpy as np

'''
a. Crie uma imagem binária A de 512x512 pixels com valor inicial igual a zero
b. Na imagem A, defina uma região com pixels iguais a 1 partindo da origem até sua metade
c. Crie uma imagem binária B como o complemento da imagem A
c. Crie uma imagem binária B como o complemento da imagem A
e. Calcule quantos pixels iguais a 1 cada imagem (A, B e C) possui
f. Utilize as imagens A, B e C para construir uma imagem colorida, sendo a imagem A incluída
no canal R, a imagem B no canal G e a imagem C no canal B.
'''

rows = 512
cols = 512

A = np.zeros((rows, cols), dtype=np.uint8)

A[0:255, 0:255] = 255
B = cv.bitwise_not(A)

cv.imshow('A', A)
cv.waitKey(0)
cv.imshow('B', B)
cv.waitKey(0)

C = cv.bitwise_or(A, B)
cv.imshow('C', C)
cv.waitKey(0)

countA = 0
countB = 0
countC = 0

def count(img, rows, cols, countImg):
    for row in range(rows):
        for col in range(cols):
            if img[row, col] == 255:
                countImg += 1

    return countImg

print(count(A, rows, cols, countA))
print(count(B, rows, cols, countB))
print(count(C, rows, cols, countC))

ColorABC = np.zeros((rows, cols, 3), dtype=np.uint8)
ColorABC[:, :, 0] = A
cv.imshow('ColorABC', ColorABC)
cv.waitKey(0)
ColorABC[:, :, 1] = B
cv.imshow('ColorABC', ColorABC)
cv.waitKey(0)
ColorABC[:,:, 2] = C
cv.imshow('ColorABC', ColorABC)
cv.waitKey(0)