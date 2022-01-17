//
//  ProductTabs.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/14/22.
//

import SwiftUI



struct ProductTabs : View {
    var section: Section
    
    @State private var currentView: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(section.title)
                .foregroundColor(.white)
            
            
            GeometryReader { geo in
                let midX = geo.frame(in: .local).midX
                
                ScrollView(.horizontal, showsIndicators: false) {
                    Rectangle()
                        .foregroundColor(.dividerColor)
                        .frame(height: 1)
                    
                    LazyHStack {
                        ForEach(section.products)  { product in
                            
                            ProductCard(product: product)
                                .background(GeometryReader { productProxy in
                                    let productX = productProxy.frame(in: .local).midX
                                    Color.clear
                                        .preference(key: ScrollOffsetPreferenceKey.self, value: productX)
                                        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                                            if let i = section.products.firstIndex(of: product) {
                                                print("Preference value is \(value)")
                                                print("product \(i) minY is \(value)")
                                                if productX < midX {
                                                    print("current index is \(i)")
                                                }
                                                self.currentView = i
                                            }
                                            
                                        }
                                })
                        }
                    }
                }
            }
            .frame(maxHeight: 200)
            
            
            HStack {
                Spacer()
                ForEach(section.products) { product in
                    let i = section.products.firstIndex(of: product)
                    Circle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(self.currentView == i ? .white : .darkGray)
                }
                Spacer()
            }
            
        }
        .frame(maxHeight: 400)
    }
}

struct ProductTabs_Previews: PreviewProvider {
    static var previews: some View {
        ProductTabs(section: Section.example)
    }
}
