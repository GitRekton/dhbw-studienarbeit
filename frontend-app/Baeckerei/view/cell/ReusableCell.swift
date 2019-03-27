//
//  ReusableCell.swift
//  Baeckerei
//
//  Created by Gregory Seibert on 26.03.19.
//  Copyright © 2019 Gregory Seibert. All rights reserved.
//

import Foundation

public protocol ReusableCell {
    static var reuseIdentifier: String { get }
}

public extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
