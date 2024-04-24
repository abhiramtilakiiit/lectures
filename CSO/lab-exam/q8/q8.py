"""shut up"""
import subprocess
import random
import unittest

subprocess.run(["gcc", "q8.c", "q8.s"], check=False)

def run(inp: str):
    """shut up"""
    return subprocess.run(
        "./a.out",
        input=inp,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
        text=True,
    ).stdout

def wave(n_n, arr):
    """shut up"""
    string = " ".join(arr)
    return run(f"{n_n}\n{string}")

def wave_py(n_n, arr):
    """shut up"""
    arr = [int(i) for i in arr]
    arr = sorted(arr)
    i = 0
    while i < n_n-1:
        arr[i], arr[i+1] = arr[i+1], arr[i]
        i += 2
    arr = [str(i) for i in arr]
    return " ".join(arr) + " \n"

def generate_random():
    """shut up"""
    n_n = random.randint(1, 10000)
    arr = []
    for _ in range(n_n):
        arr.append(str(random.randint(1,1000000000)))
    return n_n, arr

class Test(unittest.TestCase):
    """shut up"""
    def test_everything(self):
        """shut up"""
        for _ in range(1,100):
            n_n, arr = generate_random()
            print(n_n)
            self.assertEqual(wave(n_n, arr), wave_py(n_n, arr))


unittest.main()
