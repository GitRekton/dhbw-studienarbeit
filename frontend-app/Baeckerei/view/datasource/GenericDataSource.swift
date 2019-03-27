//
//  GenericDataSource.swift
//  Baeckerei
//
//  Created by Gregory Seibert on 26.03.19.
//  Copyright © 2019 Gregory Seibert. All rights reserved.
//

import Foundation

class GenericDataSource<T>: NSObject {
    var data: [T] = []
}
