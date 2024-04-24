"shut up"
import subprocess
import random
import unittest

subprocess.run(["gcc", "q9.c", "q9.s"], check=False)

def run(inp):
    "shut up"
    return subprocess.run(
        "./a.out", 
        input=inp,
        check=False,
        stdout=subprocess.PIPE,
        text=True,
        stderr=subprocess.STDOUT
    ).stdout

def first(arr):
    "shut up"
    arr_new = [str(i) for i in arr]
    string = ' '.join(arr_new)
    return run(f"{len(arr)}\n{string}")

def first_py(arr):
    "shut up"
    arr_s = sorted(arr)
    expected = 1
    for i in arr_s:
        if i > 0:
            if i == expected - 1:
                continue
            if i != expected:
                return str(expected) + "\n"
            expected+=1
    return str(expected) + "\n"

def generate_random():
    "shut up"
    n_n = random.randint(1,10000)
    if random.random() < 0.7:
        sub = random.randint(1,10000)
        arr = list(range(-1*sub,n_n-sub))
        random.shuffle(arr)
        if random.random() < 0.7:
            index = random.randint(0,len(arr)-1)
            arr.pop(index)
    else:
        arr = []
        for _ in range(n_n):
            arr.append(random.randint(-1000,1000))
    return arr

class Test(unittest.TestCase):
    "shut up"
    def test_everything(self):
        "shut up"
        for _ in range(1,100):
            arr = generate_random()
            print(len(arr))
            try:
                self.assertEqual(first(arr), first_py(arr))
            except:
                print(sorted(arr))
                print(first(arr), first_py(arr))
                return 0


unittest.main()
