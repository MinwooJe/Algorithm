while True:
    try:
        a, b = map(int, input().split())
        print(a+b)
    except EOFError:        # EOF(End Of File)을 처리하기 위해서는 try ~ catch 문을 사용해 EOFError가 나올 시 예외처리를 해주면 된다.
        break