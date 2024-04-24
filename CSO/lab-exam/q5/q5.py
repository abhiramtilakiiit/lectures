"""to  test my q5"""
import subprocess
from random import randint
import unittest

subprocess.run(["gcc", "q5.c", "q5.s"], check=False)

def run(inp: str):
    """to run in shell"""
    return subprocess.run(
        "./a.out",
        input = inp,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=True,
        text=True
    ).stdout

def rearrange(n_n, arr):
    """new string to be passed into shell"""
    string = " ".join(arr)
    return run(f"{n_n}\n{string}")

def rearrange_py(_n, arr):
    """python implementation"""
    return " ".join(sorted(arr)) + " \n"

def generate_random():
    """generate random input"""
    n_n = randint(1,100000)
    arr = []
    for _ in range(n_n):
        arr.append(str(randint(0,1)))
    return n_n, arr

class Test(unittest.TestCase):
    """unittesting"""
    def test_everything(self):
        """shut up"""
        for _ in range(100):
            n_n, arr = generate_random()
            print(n_n)
            self.assertEqual(rearrange(n_n, arr), rearrange_py(n_n, arr))


unittest.main()
