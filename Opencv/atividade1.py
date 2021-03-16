import cv2 as cv
import numpy as np

'''
(Questão 2.22/Gonzalez) A subtração de imagens costuma ser utilizada em aplicações industriais
para detectar componentes faltando na montagem de um produto. A metodologia é armazenar uma
imagem “ótima” que corresponda à montagem correta; essa imagem é então subtraída das
imagens do mesmo produto. Teoricamente, as diferenças serão zero se os novos produtos forem
montados corretamente. As imagens da diferença para os produtos com componentes faltantes
seriam diferentes de zero na área onde diferem da imagem ótima. Quais condições você acha que
deveriam ser atendidas na prática para esse método funcionar?
'''

rows = 300
cols = 300

A = np.zeros((rows, cols), dtype=np.uint8)
B = np.zeros((rows, cols), dtype=np.uint8)
A[50:250, 75:225] = 255
B[20:250, 60:240] = 255
final_img = cv.hconcat((A, B))
cv.imshow('Os dois objetos', final_img)
cv.waitKey(0)

C = cv.bitwise_xor (A, B)
cv.imshow('Parte com defeito', C)
cv.waitKey(0)