"""used to test question3"""
from random import randint
import unittest
import subprocess

subprocess.run(["gcc", "q3.c", "q3.s"], check=False)

def run(inp: str):
    """run the file"""
    return subprocess.run(
        "./a.out",
        input=inp,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=True,
        text=True
    ).stdout

def multiples(n_n):
    """this function constructs input"""
    return run(str(n_n))

def multiples_py(n_n):
    """this function finds multiples"""
    string = ""
    for i in range(1,n_n+1):
        if i % 15 == 0:
            string += "-3 "
        elif i % 3 == 0:
            string += "-1 "
        elif i % 5 == 0:
            string += "-2 "
        else:
            string += str(i)
            string += " "
    return string

def generate_random():
    """generate random input for testing"""
    return randint(1, 100000)


class Test(unittest.TestCase):
    """class used for unittesting"""
    def test_everything(self):
        """used to test everything"""
        for _ in range(1,1000):
            n_n = generate_random()
            print(n_n)
            self.assertEqual(multiples(n_n), multiples_py(n_n))
        self.assertEqual(multiples(0), multiples_py(0))

unittest.main()
