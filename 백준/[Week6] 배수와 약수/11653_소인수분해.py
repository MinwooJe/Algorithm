n = int(input())
prime_list = []
# n보다 작은 소수 찾기
def find_prime_small_than(n):
    if n != 1:
        for i in range(2, n+1):
            count = 0
            for j in range(2, i):
                if i % j == 0:
                    count += 1
            if count == 0:
                prime_list.append(i)
            count = 0
    return prime_list

# 에라토스테네스의 체
def sieve_of_eratosthenes(a):
    numbers = [x for x in range(2, a+1) if x % 2 == 1]
    print(numbers)
    for i in numbers:           # 작은 수들부터 하나씩 뽑아서
        for j in range(2, ):   # 곱할 수들 뽑기
            print(i*j)
            if i * j in numbers:
                numbers.remove(i * j)
                print(numbers)
    return numbers
print(sieve_of_eratosthenes(n))
# 소인수분해
prime = find_prime_small_than(n)
result = []

for i in prime:
    if n % i == 0:
        while n % i == 0:
            n = n // i
            print(i)