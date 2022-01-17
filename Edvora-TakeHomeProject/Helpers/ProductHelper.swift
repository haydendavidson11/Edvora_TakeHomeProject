//
//  ProductHelper.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/11/22.
//

import Foundation
import SwiftUI


class ProductHelper {
    let networkHelper = NetworkHelper()
    
    var allProducts: [Product]

    @Published var filteredProducts: [Product]
    
    init() {
        
        self.allProducts = networkHelper.getAllProducts()
        self.filteredProducts = allProducts
    }

    
    // get all product names for creating new sections
    func getProductNames() -> Set<String> {
        var productNames: Set<String> = []
        
        for product in allProducts {
            productNames.insert(product.product_name)
        }
        
        return productNames
    }
    
}
