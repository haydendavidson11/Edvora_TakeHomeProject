//
//  Address.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/11/22.
//

import Foundation

struct Address: Decodable, Hashable {
    var state: String
    var city: String
    
    // example address for previews
    static let example = Address(state: "Andaman and Nicobar Islands", city: "Port Blair")
}
