import Foundation
/**
n = 5일 때
1) 한 번 사용
5

2) 두 번 사용
55, 5 + 5, 5 - 5, 5 * 5, 5 / 5

3) 세 번 사용
555
(55) + 5, (55) - 5, (55) * 5, (550 / 5
5 + (55), 5 - (55), 5 * (55), 5 / (55)
(5+5)+5, (5+5)-5, (5+5)*5, (5+5)/5
(5-5)+5, (5-5)-5, (5-5)*5, (5-5)/5
(5*5)*5, (5*5)-5, (5*5)*5, (5*5)/5
(5/5)+5, (5/5)-5, (5/5)*5, (5/5)/5
-> 괄호 안에 있는 수는 결국 5를 두 번 사용해서 만든 것.

규칙: 
(k번 사용한 수를 k라고 표현, k-1, k-2, ... 도 마찬가지)
숫자 n을 k번 사용해서 만들 수 있는 모든 수는
0. n을 k번 연달아 사용한 수 (ex. 555555)
1. (k-1) 사칙연산 (1)
2. (k-2) 사칙연산 (2)
3. (k-3) 사칙연산 (3)
...
k-1. (1) 사칙연산 (k-1)

로직:
숫자는 최대 8개까지 사용가능. 위 조건 이용하면.

1개를 이용해 만들 수 있는 수 부터 8개 이용해 만들 수 있는 수까지 모두 구함.  
각각을 Set에 저장. (중복 원소 많으므로)

*/
func solution(_ N:Int, _ number:Int) -> Int {
    var arr = Array(repeating: Set<Int>(), count: 8)
    
    for repeating in 1...8 {        // 숫자 N을 repeating만큼 사용했을 때
        var numbers = Set<Int>()
        numbers.insert(Int(String(repeating: "\(N)", count: repeating))!)

        for i in 1..<repeating {
            let (left, right) = (i, repeating - i)
            numbers = numbers.union(operate(arr[left - 1], arr[right - 1]))
        }
        
        if numbers.contains(number) {
            return repeating
        }
        
        arr[repeating - 1] = arr[repeating - 1].union(numbers)
    }

    return -1
}

func operate(_ left: Set<Int>, _ right: Set<Int>) -> Set<Int> {
    var result = Set<Int>()
    
    for l in left {
        for r in right {
            result.insert(l + r)
            result.insert(l - r)
            result.insert(l * r)
            if r != 0 {
                result.insert(l / r)
            }
        }
    }
    
    return result
}
