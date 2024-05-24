def solution(number, limit, power):
    power_list = count_div(number)
    for i in range(len(power_list)):
        if power_list[i] > limit:
            power_list[i] = power
    return sum(power_list)

def count_div(number):
    power_list = []
    for i in range(1, number+1):
        count = 0
        for j in range(1, int(i**(0.5)) + 1):
            if i % j == 0:
                count += 1
                if i != j*j:
                    count += 1
        power_list.append(count)
    return power_list

