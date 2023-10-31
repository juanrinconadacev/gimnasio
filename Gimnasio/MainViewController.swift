

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lessonsTableView: UITableView!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    let lessons: [Lesson] = [Lesson(#imageLiteral(resourceName: "yoga"), "Yoga"),
                   Lesson(#imageLiteral(resourceName: "zumba"), "Zumba"),
                   Lesson(#imageLiteral(resourceName: "pilates"), "Pilates"),
                   Lesson(#imageLiteral(resourceName: "spinning"), "Spinning")]
    var row = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Saludo
        let username = UserDefaults.standard.string(forKey: "username") ?? ""
        greetingLabel.text = "Hola " + username + ", elige una clase:"
        
        // Lista de clases
        lessonsTableView.dataSource = self
        lessonsTableView.delegate = self
    }
    
    // Pregunta cuantas filas hay que crear
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    // Se lanza para crear cada fila (bucle)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell") as! LessonTableViewCell
        let row = indexPath.row
        let lesson = lessons[row]
        cell.lessonLabel.text = lesson.name
        cell.lessonImageView.image = lesson.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
        performSegue(withIdentifier: "toDetailScreen", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailScreen = segue.destination as! DetailViewController
        let lesson = lessons[row]
        detailScreen.lessonName = lesson.name
        detailScreen.lessonImage = lesson.image
    }
}
