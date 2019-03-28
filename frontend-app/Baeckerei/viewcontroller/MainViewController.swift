//
//  MainViewController.swift
//  Baeckerei
//
//  Created by Gregory Seibert on 01.02.19.
//  Copyright © 2019 Gregory Seibert. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate {
    let loafMasterViewController = LoafMasterViewController()
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo_header"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var dataSource: ImageLabelDataSource = {
        let dataSource = ImageLabelDataSource()
        
        let image = UIImage(named: "buns")!
        
        let tileColor = UIColor(displayP3Red: 190/255, green: 235/255, blue: 235/255, alpha: 1)
        
        dataSource.data = [
            ImageLabelData(label: "Brötchen", image: image, color: tileColor),
            ImageLabelData(label: "Brote", image: image, color: tileColor),
            ImageLabelData(label: "Süße Stückchen", image: image, color: tileColor),
            ImageLabelData(label: "Snacks", image: image, color: tileColor),
            ImageLabelData(label: "Dauergebäcke", image: image, color: tileColor),
            ImageLabelData(label: "Wochenendgebäcke", image: image, color: tileColor),
            ImageLabelData(label: "Kuchen", image: image, color: tileColor),
            ImageLabelData(label: "Torten", image: image, color: tileColor),
            ImageLabelData(label: "Desserts", image: image, color: tileColor),
            ImageLabelData(label: "Saisonales", image: image, color: tileColor),
        ]
        
        dataSource.collectionItemSelectionHandler = handleCollectionViewCellSelection
        
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
        
        navigationItem.titleView = logoImageView
        
        view.backgroundColor = UIColor(white: 0.2, alpha: 1)
        
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        
        view.addSubview(collectionView)
    }
    
    func handleCollectionViewCellSelection(indexPath: IndexPath) {
        print(indexPath.row)
        
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(loafMasterViewController, animated: true)
        }
    }
    
    /*
    override func viewDidAppear(_ animated: Bool) {
        if bakeryDatasource.existingBakedGoodsOnDisk(diskFileName: .bun) && bakeryDatasource.existingBakedGoodsOnDisk(diskFileName: .loaf) && bakeryDatasource.existingBakedGoodsOnDisk(diskFileName: .news) {
            askForDataSource()
        } else {
            setDataFromApi()
        }
    }
    
    func setupTabBarItems() {
        let navigationControllerLoafs = UINavigationController(rootViewController: loafMasterViewController)
        navigationControllerLoafs.tabBarItem.image = UIImage(named: "loafs")
        navigationControllerLoafs.title = NSLocalizedString("loafs", comment: "")
        
        let navigationControllerBuns = UINavigationController(rootViewController: bunMasterViewController)
        navigationControllerBuns.tabBarItem.image = UIImage(named: "buns")
        navigationControllerBuns.title = NSLocalizedString("buns", comment: "")
        
        let navigationControllerNews = UINavigationController(rootViewController: newsMasterViewController)
        navigationControllerNews.tabBarItem.image = UIImage(named: "news")
        navigationControllerNews.title = NSLocalizedString("news", comment: "")
        
        viewControllers = [navigationControllerLoafs, navigationControllerBuns, navigationControllerNews]
    }
    
    private func askForDataSource() {
        let title = NSLocalizedString("datasource_choice_title", comment: "")
        let message = NSLocalizedString("datasource_choice_message", comment: "")
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let optionDiskTitle = NSLocalizedString("datasource_choice_option_disk", comment: "")
        let optionDisk = UIAlertAction(title: optionDiskTitle, style: .default) { UIAlertAction in
            self.setDataFromDisk()
        }
        
        let optionApiTitle = NSLocalizedString("datasource_choice_option_api", comment: "")
        let optionApi = UIAlertAction(title: optionApiTitle, style: .default) { UIAlertAction in
            self.setDataFromApi()
        }
        
        alertController.addAction(optionDisk)
        alertController.addAction(optionApi)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func setDataFromDisk() {
        bakeryDatasource.getBakedGoodsFromDisk(diskFileName: .loaf, successCallback: loafMasterViewController.setData)
        bakeryDatasource.getBakedGoodsFromDisk(diskFileName: .bun, successCallback: bunMasterViewController.setData)
        bakeryDatasource.getNewsItemsFromDisk(successCallback: newsMasterViewController.setData)
    }
    
    private func setDataFromApi() {
        bakeryDatasource.login {
            self.bakeryDatasource.getBakedGoodsFromAPI(endpoint: .loaf, diskFileName: .loaf, successCallback: self.loafMasterViewController.setData)
            self.bakeryDatasource.getBakedGoodsFromAPI(endpoint: .bun, diskFileName: .bun, successCallback: self.bunMasterViewController.setData)
            self.bakeryDatasource.getNewsItemsFromAPI(successCallback: self.newsMasterViewController.setData)
        }
    }
    */
}
