//
//  DetailViewController.swift
//  Gimnasio
//
//  Created by user199132 on 31/10/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var lessonName: String = ""
    var lessonImage: UIImage? = #imageLiteral(resourceName: "yoga")
    
    @IBOutlet weak var lessonLabel: UILabel!
    @IBOutlet weak var lessonImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lessonLabel.text = lessonName
        lessonImageView.image = lessonImage
    }

}
