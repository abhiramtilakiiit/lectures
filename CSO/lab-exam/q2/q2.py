"""Testing my count odd implementations"""
from random import randint
import unittest
import subprocess

subprocess.run(["gcc", "q2.c", "q2.s"], check=False)

def run(inp: str):
    """run the process in terminal"""
    return subprocess.run(
        "./a.out",
        input=inp,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=True
    ).stdout

def count_int_py(n_n):
    """python implementation of bit_count"""
    return bin(n_n).count("1")

def count_int(n_n):
    """sending input to run"""
    run(str(n_n))


class Test(unittest.TestCase):
    """unittesting class"""
    def test_everything(self):
        """function to test everything"""
        for _ in range(100000):
            n_n = randint(0,1000000000000000000)
            print(n_n)
            self.assertEqual(
                count_int_py(n_n),
                count_int_py(n_n)
            )
        self.assertEqual(count_int_py(0),count_int_py(0))

unittest.main()
