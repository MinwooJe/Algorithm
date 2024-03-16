student = []
for i in range(28):
    student.append(int(input()))

for i in range(30):
    if i + 1 not in student:
        print(i + 1)