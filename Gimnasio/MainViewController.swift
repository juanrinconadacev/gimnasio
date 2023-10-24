

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var clasesTableView: UITableView!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
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
        return 4
    }
    
    // Se lanza para crear cada fila
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("fila", indexPath.row)
        return UITableViewCell()
    }

}
