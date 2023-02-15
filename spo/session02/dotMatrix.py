import numpy as np


def dotCounting(m1, m2):
    new_matrix = np.zeros((len(m1), len(m2)), dtype=int)

    for (i, _) in enumerate(m1):
        for (j, _) in enumerate(m2):
            new_matrix[i][j] = sum([m1[i][k] * m2[k][j]
                                   for k in range(len(m1))])

    return new_matrix


def dotLogical(m1, m2):
    new_matrix = np.zeros((len(m1), len(m2)), dtype=int)

    i = 0
    while (i < len(m1)):
        j = 0
        while (j < len(m2)):
            new_matrix[i][j] = sum([m1[i][k] * m2[k][j]
                                   for k in range(len(m1))])
            j += 1
        i += 1

    return new_matrix


matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

print(dotCounting(matrix, matrix))
print(dotLogical(matrix, matrix))
