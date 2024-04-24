"""test maxsum"""
import subprocess
import unittest
import random

subprocess.run(["gcc", "q7.c", "q7.s"], check=False)

def run(inp: str):
    """run shit"""
    return subprocess.run(
        "./a.out", 
        input=inp,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
        text=True,
    ).stdout

def maxsum(n_n,b_b,arr):
    """shut up"""
    string = " ".join([str(i) for i in arr])
    return run(f"{n_n} {b_b}\n{string}")

def maxsum_py(n_n, b_b, arr):
    """shut up"""
    left = b_b
    right = 0
    sumi = sum(arr[:b_b]) if b_b < n_n else sum(arr)
    maxi = -1 << 63
    while left >= 0:
        if 0 <= left < n_n and 0 <= n_n - right < n_n:
            sumi -= arr[left]
            sumi += arr[n_n-right]
            maxi = max(maxi,sumi)
        right += 1
        left -= 1
    return str(maxi) + '\n'

def generate_random():
    """generate random input"""
    n_n = random.randint(1, 100000)
    b_b = random.randint(1, 100000)
    arr = []
    for _ in range(n_n):
        arr.append(random.randint(-1000000000,1000000000))
    return n_n, b_b, arr

class Test(unittest.TestCase):
    """shut up"""
    def test_everything(self):
        """shut up"""
        for _ in range(100):
            n_n, b_b, arr = generate_random()
            print(n_n,b_b)
            self.assertEqual(maxsum(n_n,b_b,arr), maxsum_py(n_n,b_b,arr))

unittest.main()
