"""Module docstring"""
import subprocess
import random
import unittest

subprocess.run(["gcc", "q4.c", "q4.s"], check=False)

def run(inp: str):
    """runs in shell"""
    return subprocess.run("./a.out",
        input=inp,stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        check=False
    ).stdout

def palindrome(n_n):
    """send to shell"""
    return run(str(n_n))

def palindrome_py(n_n):
    """python implementation"""
    n_n = str(n_n)
    n_n_rev = n_n[::-1]
    if n_n_rev == n_n:
        return "True\n"
    return "False\n"

def generate_random():
    """function to generate random input for fuzzing"""
    curr = random.random()
    if curr < 0.7:
        n_n = str(random.randint(1,10000))
        n_n_rev = n_n[::-1]
        return int(n_n + n_n_rev)
    return random.randint(1,10000000)

class Test(unittest.TestCase):
    """class for testing"""
    def test_everything(self):
        """function used  to test everything"""
        for _ in range(10000):
            n_n = generate_random()
            print(n_n)
            self.assertEqual(palindrome(n_n), palindrome_py(n_n))
        self.assertEqual(palindrome(0), palindrome_py(0))
        self.assertEqual(palindrome(3), palindrome_py(3))


unittest.main()
