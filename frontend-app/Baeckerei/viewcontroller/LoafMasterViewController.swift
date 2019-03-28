//
//  LoafMasterViewController.swift
//  Baeckerei
//
//  Created by Gregory Seibert on 16.01.19.
//  Copyright © 2019 Gregory Seibert. All rights reserved.
//

import UIKit

class LoafMasterViewController: UIViewController {
    private var searchController: UISearchController?
    
    private var dataArray: [Loaf] = []
    private var imageDataArray: [Data] = []
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo_header"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var dataSource: ImageLabelDataSource = {
        let dataSource = ImageLabelDataSource()
        
        let image = UIImage(named: "bun_default")!
        
        dataSource.data = [
            ImageLabelData(label: "Brötchen", image: image),
            ImageLabelData(label: "Brote", image: image),
            ImageLabelData(label: "Süße Stückchen", image: image),
            ImageLabelData(label: "Snacks", image: image),
            ImageLabelData(label: "Dauergebäcke", image: image),
            ImageLabelData(label: "Wochenendgebäcke", image: image),
            ImageLabelData(label: "Kuchen", image: image),
            ImageLabelData(label: "Torten", image: image),
            ImageLabelData(label: "Desserts", image: image),
            ImageLabelData(label: "Saisonales", image: image),
        ]
        
        //dataSource.collectionItemSelectionHandler = handleCollectionViewCellSelection
        
        return dataSource
    }()
    
    private let collectionViewFlowLayout = CollectionViewFlowLayout(display: .grid)
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewFlowLayout)
        collectionView.register(ImageLabelCollectionViewCell.self, forCellWithReuseIdentifier: ImageLabelCollectionViewCell.reuseIdentifier)
        collectionView.alwaysBounceVertical = true
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.backgroundColor = UIColor(white: 0, alpha: 0)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        setupNavigationbar()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
    }
    
    private func setupNavigationbar() {
        navigationItem.titleView = logoImageView
        
//        searchController = UISearchController(searchResultsController: nil)
//        searchController!.searchResultsUpdater = self
//        searchController!.obscuresBackgroundDuringPresentation = false
//        searchController!.searchBar.placeholder = NSLocalizedString("searchbar_loafs", comment: "")
//
//        searchController!.searchBar.scopeButtonTitles = [
//            NSLocalizedString("noallergens", comment: ""),
//            NSLocalizedString("egg", comment: ""),
//            NSLocalizedString("nut", comment: ""),
//            NSLocalizedString("milk", comment: ""),
//            NSLocalizedString("gluten", comment: "")
//        ]
//        searchController!.searchBar.delegate = self
//
//        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    func setData(dataArray: [Loaf], imageDataArray: [Data]) {
        self.dataArray = dataArray
        self.imageDataArray = imageDataArray
        
        //dataSource.data = dataArray
        
        collectionView.reloadData()
    }
    
//    func searchBarIsEmpty() -> Bool {
//        return searchController!.searchBar.text?.isEmpty ?? true
//    }
//
//    func isFiltering() -> Bool {
//        let searchBarScopeIsFiltering = searchController!.searchBar.selectedScopeButtonIndex != 0
//
//        return searchController!.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
//    }
//
//    func filterContentForSearchText(_ searchText: String, scope: String = NSLocalizedString("noallergens", comment: "")) {
//        filteredLoafArray = loafArray.filter({( loaf : Loaf) -> Bool in
//            let doesCategoryMatch = (scope == NSLocalizedString("noallergens", comment: "")) || (!loaf.hasAllergyType(allergyType: AllergyType.fromString(string: scope)!))
//
//            if searchBarIsEmpty() {
//                return doesCategoryMatch
//            } else {
//                return doesCategoryMatch && loaf.name.lowercased().contains(searchText.lowercased())
//            }
//        })
//
//        collectionView.reloadData()
//    }
}

//extension LoafMasterViewController: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return isFiltering() ? filteredLoafArray.count : loafArray.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ImageLabelCollectionViewCell
//
//        let currentItem = isFiltering() ? filteredLoafArray[indexPath.row] : loafArray[indexPath.row]
//
//        if indexPath.row < imageDataArray.count {
//            let imageData = imageDataArray[indexPath.row]
//
//            cell.imageViewPicture.image = imageData.count > 0 ? UIImage(data: imageData) : defaultCellImage
//        } else {
//            cell.imageViewPicture.image = defaultCellImage
//        }
//
//        cell.labelName.text = currentItem.name
//
//        return cell
//    }
//}
//
//extension LoafMasterViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detailViewController = LoafDetailViewController()
//        let item = isFiltering() ? filteredLoafArray[indexPath.row] : loafArray[indexPath.row]
//        let image = (collectionView.cellForItem(at: indexPath) as! ImageLabelCollectionViewCell).imageViewPicture.image
//
//        detailViewController.setData(item: item, image: image ?? defaultCellImage!)
//
//        navigationController?.pushViewController(detailViewController, animated: true)
//    }
//}
//
//extension LoafMasterViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        let searchBar = searchController.searchBar
//        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
//
//        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
//    }
//}
//
//extension LoafMasterViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
//    }
//}
