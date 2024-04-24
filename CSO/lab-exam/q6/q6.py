"""run tests"""
import subprocess
from random import randint
import unittest
import math

subprocess.run(["gcc", "q6.c", "q6.s"], check=False)

def run(inp: str):
    "shut up"
    return subprocess.run(
        "./a.out",
        input=inp,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
        text=True
    ).stdout

def gcd(n_n,m_m):
    "shut up"
    return run(f"{n_n} {m_m}")

def gcd_py(n_n,m_m):
    "shut up"
    return str(math.gcd(n_n, m_m)) + "\n"

def generate_random():
    "shut up"
    return randint(1,1000000000), randint(1,1000000000)

class Test(unittest.TestCase):
    "shut up"
    def test_everything(self):
        "shut up"
        for _ in range(10000):
            n_n, m_m = generate_random()
            print(n_n, m_m)
            self.assertEqual(gcd(n_n,m_m), gcd_py(n_n,m_m))

unittest.main()
