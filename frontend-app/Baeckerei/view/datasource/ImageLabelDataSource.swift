//
//  ImageLabelDataSource.swift
//  Baeckerei
//
//  Created by Gregory Seibert on 27.03.19.
//  Copyright © 2019 Gregory Seibert. All rights reserved.
//

import UIKit

public typealias CollectionItemSelectionHandlerType = (IndexPath) -> Void

class ImageLabelDataSource: GenericDataSource<ImageLabelData>, UICollectionViewDataSource, UICollectionViewDelegate {
    public var collectionItemSelectionHandler: CollectionItemSelectionHandlerType?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageLabelCollectionViewCell.reuseIdentifier, for: indexPath) as! ImageLabelCollectionViewCell
        
        cell.configure(data[indexPath.row], at: indexPath)
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionItemSelectionHandler?(indexPath)
    }
}
