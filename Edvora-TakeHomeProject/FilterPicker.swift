//
//  FilterPicker.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/13/22.
//

import SwiftUI

struct FilterPicker: View {
    @ObservedObject var sectionHelper: SectionHelper
    
    @State private var product: String = ""
    @State private var state = ""
    
    @State private var city = ""
    
    var filterType: String
    
    
    var body: some View {
        Group {
            switch filterType {
            case "Products":
                Picker(selection: $product) {
                    ForEach(sectionHelper.sections) { section in
                        Text(section.title)
                            .foregroundColor(.lightGrey)
                            .tag(section.title)
                    }
                } label: {
                    Text("")
                }
                .accentColor(.lightGrey)
                .pickerStyle(.menu)
                .onChange(of: product) { newValue in
                    sectionHelper.buildSections(.products, product)
                }
                
                
                
            case "State":
                Picker(selection: $state) {
                    ForEach(sectionHelper.states, id: \.self) {
                        Text($0)
                            .foregroundColor(.lightGrey)
                    }
                } label: {
                    Text(state)
                }
                .accentColor(.lightGrey)
                .pickerStyle(.menu)
                .onChange(of: state) { newValue in
                    sectionHelper.buildSections(.state, state)
                }
                
                
            default:
                Picker(selection: $city) {
                    ForEach(sectionHelper.cities, id: \.self) {
                        Text($0)
                            .foregroundColor(.lightGrey)
                    }
                } label: {
                    Text(city)
                }
                .accentColor(.lightGrey)
                .pickerStyle(.menu)
                .onChange(of: city) { newValue in
                    sectionHelper.buildSections(.city, city)
                }
                
            }
        }
    }
}

struct FilterPicker_Previews: PreviewProvider {
    static var previews: some View {
        FilterPicker(sectionHelper: SectionHelper(), filterType: "Products")
    }
}
