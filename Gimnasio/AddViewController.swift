
import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var lessonNameTextField: UITextField!
    @IBOutlet weak var teacherTextField: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var fullSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func add(_ sender: UIButton) {
        if !lessonNameTextField.text!.isEmpty && !teacherTextField.text!.isEmpty {
            let time = Int(timeSlider.value.rounded())
            let newLesson = LessonData(lessonNameTextField.text ?? "Clase", LessonInfo(time, teacherTextField.text ?? "Profesor", fullSwitch.isOn))
            postLesson(lesson: newLesson)
        }
    }
    
    @IBAction func timeChanged(_ sender: UISlider) {
        let time = timeSlider.value.rounded()
        timeLabel.text = Int(time).description +  ":00"
        timeSlider.value = time
    }
    
    func postLesson(lesson: LessonData) {
        print("Post lesson")
        let url = URL(string: "https://api.restful-api.dev/objects")
        let data = try! JSONEncoder().encode(lesson)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let json = String(data: data!, encoding: .utf8)
            print(json ?? "Error")
            do {
                let lessonDataJSON = try JSONDecoder().decode(LessonData.self, from: data!)
                ids.append(lessonDataJSON.id)
                DispatchQueue.main.async { // ejecutar código en el hilo principal
                    self.navigationController?.popViewController(animated: true)                }
            } catch {
                print("Error parseo JSON")
            }
        }.resume()
    }
}
