class LessonData: Decodable {
    var name: String
    var data: LessonInfo
}

class LessonInfo: Decodable {
    var time: Int
    var teacher: String
    var full: Bool
}
