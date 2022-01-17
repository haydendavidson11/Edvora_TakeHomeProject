//
//  NetworkHelper.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/11/22.
//

import Foundation


class NetworkHelper {
    
    
    // Fetch all products from the API
    func getAllProducts() -> [Product] {
        var result = [Product]()
        let decoder = JSONDecoder()
        
        let url = URL(string: "https://assessment-edvora.herokuapp.com")
        
        if let data  = try? Data(contentsOf: url!) {
            do {
                let decodedData = try decoder.decode(Array<Product>.self, from: data)
                result = decodedData
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }
        print("Get all products :\(result.count) products")
        return result
    }
    
}
