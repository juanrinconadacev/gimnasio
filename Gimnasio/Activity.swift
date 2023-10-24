//
//  Activity.swift
//  Gimnasio
//
//  Created by user199132 on 24/10/2023.
//

import Foundation
import UIKit

class Activity {
    var image: UIImage?
    var name: String
    
    init(_ image: UIImage?, _ name: String) {
        self.image = image
        self.name = name
    }
}
