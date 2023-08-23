//
//  ProductEntity.swift
//  view-pager
//
//  Created by FVFH4069Q6L7 on 23/08/2023.
//

import Foundation

struct ProductEntity : Codable {
    let title: String
    let description: String
    let brand: String
    let images: [String]
    
    let price : Double
    let rating: Double
}
