func solution(_ phone_number:String) -> String {
    let starCount = phone_number.count - 4
    let stars = String(repeating: "*", count: starCount)
    return stars + phone_number.suffix(4)
}