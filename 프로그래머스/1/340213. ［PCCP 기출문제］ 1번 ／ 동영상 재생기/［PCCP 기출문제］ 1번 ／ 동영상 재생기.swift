import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    func prev10Second(_ now: Int) -> Int {
        let updatedTime = now < 10 ? 0 : now - 10
        return updatedTime
    }
    
    func next10Second(_ now: Int) -> Int {
        let updatedTime = now + 10 > finalTime ? finalTime : now + 10
        return updatedTime
    }
    
    func skipOpening(_ now: Int) -> Int {
        guard now >= openingStartTime && now <= openingEndedTime else { return now }
        return openingEndedTime
    }
    
    var currTime = parseToSecond(for: pos)
    let finalTime = parseToSecond(for: video_len)
    let openingStartTime = parseToSecond(for: op_start)
    let openingEndedTime = parseToSecond(for: op_end)
    
    for command in commands {
        currTime = skipOpening(currTime)
        if command == "next" {
            currTime = next10Second(currTime)
        } else {
            currTime = prev10Second(currTime)
        }
        currTime = skipOpening(currTime)
    }
    
    return parseToMMSS(for: currTime)
}

func parseToSecond(for time: String) -> Int {
    let components = time.components(separatedBy: ":")
    return Int(components[0])! * 60 + Int(components[1])!
}

func parseToMMSS(for time: Int) -> String {
    let minute = time / 60
    let second = time % 60
    return String(format: "%02d:%02d", minute, second)
}