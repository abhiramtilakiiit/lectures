'give krishnamurty burv'
import math

def get_kg():
    'shut up'
    krishna_list = []
    for i_i in range(10000000):
        print(i_i)
        i_str = str(i_i)
        sumi = sum( math.factorial(int(j)) for j in list(i_str))
        if sumi == i_i:
            krishna_list.append(i_i)
    return krishna_list

print(get_kg())
