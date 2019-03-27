//
//  ImageLabelData.swift
//  Baeckerei
//
//  Created by Gregory Seibert on 26.03.19.
//  Copyright © 2019 Gregory Seibert. All rights reserved.
//

import UIKit

class ImageLabelData {
    var label: String
    var image: UIImage
    var color: UIColor
    
    init(label: String, image: UIImage, color: UIColor) {
        self.label = label
        self.image = image
        self.color = color
    }
    
    convenience init(label: String, image: UIImage) {
        self.init(label: label, image: image, color: .black)
    }
}
