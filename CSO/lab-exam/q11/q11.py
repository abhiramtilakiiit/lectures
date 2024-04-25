'shut up'
import subprocess
import random
import unittest

subprocess.run(["gcc", "q11.c", "q11.s"], check=False)

def run(inp: str):
    'shut up'
    return subprocess.run(
        "./a.out",
        input=inp,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        check=False,
        text=True,
    ).stdout

def line(arr):
    'shut up'
    string = ' '.join([str(i) for i in arr])
    return run(f"{len(arr)}\n{string}")

def line_py(arr):
    'shut up'
    n_n = len(arr)
    out_arr = []
    sum_val = 0

    for i in range(n_n):
        sum_val += (n_n - i - 1) if arr[i] else i

    left, right, middle = 0, n_n - 1, (n_n // 2)

    for _ in range(n_n):
        while left != middle:
            if arr[left] == 0:
                arr[left] = 1
                sum_val += right - left
                break
            if arr[right] == 1:
                arr[right] = 0
                sum_val += right - left
                break
            left += 1
            right -= 1
        out_arr.append(sum_val)
    return ' '.join([ str(i) for i in out_arr]) + ' \n'


def generate_random():
    'shut up'
    n_n = random.randint(1,100000)
    arr = []
    for _ in range(n_n):
        arr.append(random.randint(0,1))
    return arr

class Test(unittest.Testcase):
    'shut up'
    def test_everything(self):
        'shut up'
        for _ in range(10000):
            arr = generate_random()
            self.assertEqual(line(arr), line_py(arr))

    def test_zero(self):
        'shut up'
        self.assertEqual(line([0]), line_py([0]))


unittest.main()
