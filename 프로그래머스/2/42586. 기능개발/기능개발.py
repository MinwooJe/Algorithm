def solution(progresses, speeds):
    remain = [100 - x for x in progresses]
    dueDate = []
    answer = []

    for (r, s) in zip(remain, speeds):
        if r % s == 0:
            dueDate.append(r // s)
        else:
            dueDate.append(r // s + 1)

    while dueDate:
        todayTask = dueDate.pop(0)
        todayDone = 1
        while True:
            if dueDate and todayTask >= dueDate[0]:
                dueDate.pop(0)
                todayDone += 1
            else:
                break
        answer.append(todayDone)
    return answer