"shutup"
import unittest
import random
import subprocess

subprocess.run(["gcc", "q10.c", "q10.s"], check=False)

def run(inp):
    "shutup"
    return subprocess.run(
        "./a.out",
        input=inp,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
        text=True
    ).stdout

def oddsort(arr):
    "shutup"
    string = ' '.join([str(i) for i in arr])
    return run(f"{len(arr)}\n{string}")

def oddsort_py(arr):
    "shutup"
    odd = False
    even = False
    for i in arr:
        if i % 2:
            odd = True
        else:
            even = True
    if odd and even:
        return ' '.join([ str(i) for i in sorted(arr)]) + ' \n'
    return ' '.join([str(i) for i in arr]) + ' \n'

def generate_random():
    "shutup"
    n_n = random.randint(1,10)
    arr = []
    for _ in range(n_n):
        arr.append(random.randint(1,1000000000))
    return arr

class Test(unittest.TestCase):
    "shutup"
    def test_everything(self):
        "shutup"
        for _ in range(10000):
            arr = generate_random()
            print(arr)
            self.assertEqual(oddsort(arr), oddsort_py(arr))

unittest.main()
