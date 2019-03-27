//
//  CollectionViewLayout.swift
//  Baeckerei
//
//  Created by Gregory Seibert on 26.03.19.
//  Copyright © 2019 Gregory Seibert. All rights reserved.
//

import UIKit

public enum CollectionDisplay {
    case grid, list, inline
}

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    var display: CollectionDisplay = .grid {
        didSet {
            if display != oldValue {
                self.invalidateLayout()
            }
        }
    }
    
    var numberOfItemsPerRow: CGFloat = 2
    
    convenience init(display: CollectionDisplay) {
        self.init()
        
        self.display = display
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 10
        self.configLayout()
    }
    
    func configLayout() {
        switch display {
            case .inline:
                self.scrollDirection = .horizontal
                if let collectionView = self.collectionView {
                    self.itemSize = CGSize(width: collectionView.frame.width * 0.9, height: 300)
                }
            
            case .grid:
                self.scrollDirection = .vertical
                if let collectionView = self.collectionView {
                    let availableWidth: CGFloat = collectionView.bounds.width - ((numberOfItemsPerRow - 0.75) * minimumInteritemSpacing) - collectionView.contentInset.left - collectionView.contentInset.right
                    let itemWidth: CGFloat = availableWidth / numberOfItemsPerRow
                    
                    self.itemSize = CGSize(width: itemWidth , height: itemWidth)
                }
            
            case .list:
                self.scrollDirection = .vertical
                if let collectionView = self.collectionView {
                    self.itemSize = CGSize(width: collectionView.frame.width , height: 130)
                }
        }
    }
    
    override func invalidateLayout() {
        super.invalidateLayout()
        
        self.configLayout()
    }
}
