"shut up"
import subprocess
import unittest
import random
import math

subprocess.run(["gcc", "q12.c", "q12.s"], check=False)

def run(inp):
    "shut up"
    return subprocess.run(
        "./a.out",
        input=inp,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
        text=True
    ).stdout

def krishnamurthy(n_n):
    "shut up"
    return run(str(n_n))

def krishnamurthy_py(i_i):
    "shut up"
    i_str = str(i_i)
    sumi = sum( math.factorial(int(j)) for j in list(i_str))
    if sumi == i_i:
        return "True\n"
    return "False\n"


def get_random():
    "shut up"
    if random.random() < 0.7:
        return random.choice([1,2,145,40585])
    return random.randint(1,1000000000)

class Test(unittest.TestCase):
    "shut up"
    def test_everything(self):
        "shut up"
        for _ in range(10000):
            n_n = get_random()
            print(n_n)
            self.assertEqual(krishnamurthy(n_n), krishnamurthy_py(n_n))

unittest.main()
