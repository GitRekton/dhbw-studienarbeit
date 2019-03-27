//
//  ImageLabelCollectionViewCell
//  Baeckerei
//
//  Created by Gregory Seibert on 16.01.19.
//  Copyright © 2019 Gregory Seibert. All rights reserved.
//

import UIKit

class ImageLabelCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    typealias T = ImageLabelData
    
    var imageViewPicture: UIImageView = {
        let imageViewPicture = UIImageView()
        imageViewPicture.contentMode = .scaleAspectFill
        imageViewPicture.clipsToBounds = true
        imageViewPicture.translatesAutoresizingMaskIntoConstraints = false
        return imageViewPicture
    }()
    
    var labelName: UILabel = {
        let labelName = UILabel()
        labelName.textColor = .black
        labelName.textAlignment = .center
        labelName.translatesAutoresizingMaskIntoConstraints = false
        return labelName
    }()
    
    func configure(_ item: ImageLabelData, at indexPath: IndexPath) {
        labelName.text = item.label
        imageViewPicture.image = item.image
        imageViewPicture.tintColor = .black
        backgroundColor = item.color
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        clipsToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor(displayP3Red: 50/255, green: 50/255, blue: 50/255, alpha: 1).cgColor
        backgroundColor = UIColor(displayP3Red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        layer.cornerRadius = 4.0
        
        addSubview(imageViewPicture)
        addSubview(labelName)
        
        NSLayoutConstraint.activate([
            imageViewPicture.heightAnchor.constraint(equalToConstant: 75),
            imageViewPicture.widthAnchor.constraint(equalTo: imageViewPicture.heightAnchor),
            imageViewPicture.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewPicture.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: imageViewPicture.bottomAnchor),
            labelName.bottomAnchor.constraint(equalTo: bottomAnchor),
            labelName.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
