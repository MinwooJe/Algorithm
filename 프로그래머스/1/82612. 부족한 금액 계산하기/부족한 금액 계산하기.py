def solution(price, money, count):
    total_price = sum(map(lambda i: i * price, [i for i in range(1, count+1)]))
    if total_price <= money:
        return 0
    else:
        return total_price - money