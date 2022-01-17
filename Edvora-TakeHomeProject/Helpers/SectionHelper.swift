//
//  SectionHelper.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/12/22.
//

import Foundation


class SectionHelper: ObservableObject {
    let productHelper = ProductHelper()
    
    @Published var sections = [Section]()
    @Published var cities = [String]()
    @Published var states = [String]()
    
    
    func buildSections(_ filter: Filter? = nil, _ value: String? = nil)  {
        
        
        
        //  Create sections from all products organized by product name for the first time
        if self.sections.isEmpty {
            var sections = [Section]()
            for name in productHelper.getProductNames() {
                
                var newSection = Section(title: name, products: [Product]())
                
                for product in productHelper.allProducts {
                    if product.product_name == name {
                        newSection.products.append(product)
                    }
                }
                
                sections.append(newSection)
            }
            
            self.sections = sections.sorted(by: { lhs, rhs in
                lhs.title < rhs.title
            })
            getAllStates()
            getAllCities()
        }
        
        // Apply filter to sections if any have been selected.
        guard let filter = filter else { return}

        guard value != nil else {
            print("No value passed in with filter")
            return
        }
            
        switch filter {
        case .products:
            
            self.sections = sections.filter { section in
                section.title == value
            }
            getAllStates()
            getAllCities()
            
        case .state:
            
            var filteredProducts = [Product]()
            for section in sections {
                for product in section.products {
                    if product.address.state == value {
                        filteredProducts.append(product)
                    }
                }
                
                if let pos = sections.firstIndex(of: section) {
                    sections[pos].products = filteredProducts
                }
            }
            
            getAllStates()
            getAllCities()
            
            
        case .city:
            
            var filteredProducts = [Product]()
            for section in sections {
                for product in section.products {
                    if product.address.city == value {
                        filteredProducts.append(product)
                    }
                }
                
                if let pos = sections.firstIndex(of: section) {
                    sections[pos].products = filteredProducts
                }
            }
            
            getAllStates()
            getAllCities()
        }
    }
    
    
    // Get all cities listed from the sections and present them in the City Filter list
    func getAllCities() {
        cities.removeAll()
        for section in sections {
            for product in section.products {
                if !cities.contains(product.address.city) {
                    cities.append(product.address.city)
                }
            }
        }
    }
    
    // Get all states from the sections and present them in the State Filter List
    func getAllStates() {
        states.removeAll()
        for section in sections {
            for product in section.products {
                if !states.contains(product.address.state) {
                    states.append(product.address.state)
                }
            }
        }
    }
    
}
