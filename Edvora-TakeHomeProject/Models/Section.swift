//
//  Section.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/12/22.
//

import Foundation


struct Section: Identifiable, Hashable {
    
    let id = UUID().uuidString
    var title: String
    var products: [Product]
    
    // example section for previews
    static var example = Section(title: Product.example.product_name, products: [Product](repeating: Product.example, count: 4))
}
