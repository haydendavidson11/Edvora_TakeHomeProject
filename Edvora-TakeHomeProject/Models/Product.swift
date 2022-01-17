//
//  Product.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/11/22.
//

import Foundation

struct Product: Decodable, Identifiable, Hashable {
    let id = UUID().uuidString
    var product_name: String
    var brand_name: String
    var price: Int
    var address: Address
    var discription: String
    var date: String
    var time: String
    var image: String
    
    
    // Example product for previews
    static let example = Product(product_name: "Facebook Inc", brand_name: "Facebook", price: 1000, address: Address.example, discription: "Its a good product", date: "2016-09-20T10:14:07.707Z", time: "2014-11-28T01:08:24.920Z", image: "https://s3-alpha-sig.figma.com/img/be4f/81e4/4a15ebb6e3c5849185c506782bf769f8?Expires=1642982400&Signature=f6isjaC7~JW3PyEJ-iZ0Nf8o9qlyF7DM4zoMhTNZUchVcFiL8LU6poyEofqAvc2QvyZhdoWiU4C2fbmVEVDHrjPmq5hBB0YdSuJ21EmEg9SPc37FEZnW-RpN4vIRVybdoIs7xo1OTwWdHAQRztaVV1~egPtsxlIcX-ri6SUtl~P4h~YNWsI1vnD44236q84CYenBd~i7gSbGVu1o01OvlV9AuAcCQqbXrtcK6cGe0H7baZvfE1zG741e23MBprM1eTDk5-eQP~BLvFHi5-SA1g3hRYnQ7fgeW4ozEggDmh3avbNrDpJfQz0Qu5vM6hmdsItDT87ZFESpKVk6-dqo~w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA")
    
    
    // Format the string UTC date and pass it to the UI
    func formatDate() -> String {
        let unformattedDate = date
        
        var reducedDate = unformattedDate.split(separator: "T")
        reducedDate.removeLast()
        
        var splitDate = reducedDate[0].split(separator: "-")
        
        let year = splitDate[0]
   
        splitDate.remove(at: 0)
        splitDate.append(year)
        
        let result = splitDate.joined(separator: ":")
        
        return result
    }
    
    // format the product's location to be presented to the UI
    func formatLocation() -> String {
        return "\(address.city), \(address.state)"
    }
    
    // format the product's price to be presented to the UI
    func formatPrice() -> String {
        let price = Double(price)
        return String(format: "%.2f", price)
    }
}
