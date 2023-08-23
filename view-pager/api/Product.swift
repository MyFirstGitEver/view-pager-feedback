//
//  Product.swift
//  view-pager
//
//  Created by FVFH4069Q6L7 on 23/08/2023.
//

import Foundation

struct Product : Identifiable {
    var id : UUID = UUID()
    
    let title: String
    let description: String
    let brand: String
    
    let price : Double
    let rating: Double
    
    let images: [String]
    
    init() {
        title = "Iphone X"
        description = "New phone style"
        brand = "Apple"
        
        price = 35.1
        rating = 4.6
        images = ["https://i.dummyjson.com/data/products/1/1.jpg", "https://i.dummyjson.com/data/products/1/2.jpg"]
    }
    
    init(entity: ProductEntity) {
        self.title = entity.title
        self.description = entity.description
        self.brand = entity.brand
        
        self.price = entity.price
        self.rating = entity.rating
        self.images = entity.images
    }
}
