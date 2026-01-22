import math

def compute_f():
    F = [0.0] * 21

    F[1] = 1.0
    F[10] = 1.0

    for i in range(2, 10):
        F[i] = math.sin(F[i - 1] - math.cos(i))

    for i in range(11, 21):
        F[i] = math.cos(F[i - 1] + math.sin(i))

    return F


def print_f(F):
    for i in range(1, 21):
        print(f"F[{i}] = {F[i]:.15f}")


F = compute_f()
print_f(F)
