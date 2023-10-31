//
//  DetailViewController.swift
//  Gimnasio
//
//  Created by user199132 on 31/10/2023.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource {
    
    var lessonName: String = ""
    var lessonImage: UIImage? = #imageLiteral(resourceName: "yoga")
    var lessonData: [LessonData] = []
    
    @IBOutlet weak var lessonLabel: UILabel!
    @IBOutlet weak var lessonImageView: UIImageView!
    @IBOutlet weak var lessonDataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lessonLabel.text = lessonName
        lessonImageView.image = lessonImage
        lessonDataTableView.dataSource = self
        
        getLessons()
    }
    
    func getLessons() {
        print("Get Lessons")
        let url = URL(string: generateURL())
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            let json = String(data: data!, encoding: .utf8)
            print(json ?? "Error")
            do {
                let lessonDataJSON = try JSONDecoder().decode([LessonData].self, from: data!)
                self.lessonData = lessonDataJSON
                DispatchQueue.main.async { // ejecutar código en el hilo principal
                    self.lessonDataTableView.reloadData()
                }
            } catch {
                print("Error parseo JSON")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lessonInfo = lessonData[indexPath.row].data
        let cell = UITableViewCell()
        cell.textLabel?.text = lessonInfo.teacher + "      " + lessonInfo.time.description + ":00"
        cell.backgroundColor = lessonInfo.full ? UIColor.red : UIColor.green
        return cell
        
    }
    
    func generateURL() -> String {
        let ids = ["ff8081818b1b4123018b85aa6ff508dd", "ff8081818b1b4123018b85c7d5e70915", "ff8081818b1b4123018b85de0bd1095a"]
        var url = "https://api.restful-api.dev/objects?"
        for id in ids {
            url += "id=" + id + "&"
        }
        url.removeLast()
        return url
    }

}
