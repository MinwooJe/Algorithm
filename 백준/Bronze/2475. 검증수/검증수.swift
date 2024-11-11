let input = readLine()!.split(separator: " ").map { Int($0)! }
var sum = 0

for num in input {
    sum += num * num
}

print(sum % 10)
