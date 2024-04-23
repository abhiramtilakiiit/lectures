"""python testing question 1"""
import subprocess
import unittest
from random import randint

subprocess.run(["gcc q1.c q1.s"], shell=True ,check=False)

def run(input_string: str):
    """runs command in terminal"""
    return subprocess.run(
        ["./a.out"],
        input=input_string,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        shell=True,
        check=True,
        text=True,
    ).stdout

def operation(m_m, n_n, s_s):
    """calling assembly code"""
    return int(run(f"{m_m} {n_n} {s_s}"))

def operation_py(m_m, n_n, s_s):
    """python implementation"""
    if s_s == 1:
        return m_m+n_n
    if s_s == 2:
        return m_m-n_n
    if s_s == 3:
        return m_m//n_n
    if s_s == 4:
        return m_m**n_n
    if s_s == 5:
        return m_m%n_n
    return 0

def generate_random():
    """generate testcases according to the question"""
    m_m = randint(0,10000000)
    n_n = randint(1,10000000)
    s_s = randint(0,5)
    if s_s == 4 and m_m > 1000:
        m_m %= 200
        n_n %= 5
    return m_m,n_n,s_s

class Test(unittest.TestCase):
    """Class for unittesting"""
    def test_everything(self):
        """one function to do everything"""
        for _ in range(10000):
            m_m,n_n,s_s = generate_random()
            print(m_m,n_n,s_s)
            self.assertEqual(operation(m_m,n_n,s_s), operation_py(m_m,n_n,s_s))

if __name__ == "__main__":
    unittest.main()
