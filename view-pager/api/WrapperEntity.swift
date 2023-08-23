//
//  WrapperEntity.swift
//  view-pager
//
//  Created by FVFH4069Q6L7 on 23/08/2023.
//

import Foundation

struct WrapperEntity : Codable {
    let products: [ProductEntity]
    let limit : Int
}
