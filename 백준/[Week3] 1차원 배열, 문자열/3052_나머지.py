data = []

for i in range(10):
    data.append(int(input()))

for i in range(10):
    data[i] = data[i] % 42

print(len(set(data)))