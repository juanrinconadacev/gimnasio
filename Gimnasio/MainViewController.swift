

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var clasesTableView: UITableView!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    let lessons: [Activity] = [Activity(#imageLiteral(resourceName: "yoga"), "Yoga"),
                   Activity(#imageLiteral(resourceName: "zumba"), "Zumba"),
                   Activity(#imageLiteral(resourceName: "pilates"), "Pilates"),
                   Activity(#imageLiteral(resourceName: "spinning"), "Spinning")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Saludo
        let username = UserDefaults.standard.string(forKey: "username") ?? ""
        greetingLabel.text = "Hola " + username + ", elige una clase:"
        
        // Lista de clases
        clasesTableView.dataSource = self
    }
    
    // Pregunta cuantas filas hay que crear
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }
    
    // Se lanza para crear cada fila (bucle)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityCell") as! ActivityTableViewCell
        let row = indexPath.row
        let activity = lessons[row]
        cell.activityLabel.text = activity.name
        cell.activityImageView.image = activity.image
        return cell
    }

}
