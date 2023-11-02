class LessonData: Codable {
    var id: String = ""
    var name: String
    var data: LessonInfo
    init(_ name: String, _ data: LessonInfo) {
        self.name = name
        self.data = data
    }
}

class LessonInfo: Codable {
    var time: Int
    var teacher: String
    var full: Bool
    
    init(_ time: Int, _ teacher: String, _ full: Bool) {
        self.time = time
        self.teacher = teacher
        self.full = full
    }
}
