//
//  ConfigurableCell.swift
//  Baeckerei
//
//  Created by Gregory Seibert on 26.03.19.
//  Copyright © 2019 Gregory Seibert. All rights reserved.
//

import Foundation

public protocol ConfigurableCell: ReusableCell {
    associatedtype T
    
    func configure(_ item: T, at indexPath: IndexPath)
}
