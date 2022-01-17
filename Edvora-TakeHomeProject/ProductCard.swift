//
//  ProductCard.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/11/22.
//

import SwiftUI

struct ProductCard: View {
    var product: Product
    
    
    var body: some View {
        ZStack {
            // Background for the Card
            Color.black
                .cornerRadius(4.69)
            
            // Main Content Layout
            VStack(alignment: .leading, spacing: 8) {
                
                // Top HStack for image and product info
                HStack {
                    AsyncImage(url: URL(string: product.image)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 70, maxHeight: 70)
                            .cornerRadius(5)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(product.product_name)
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                        Text(product.brand_name)
                            .foregroundColor(.lightGrey)
                            .font(.system(size: 13))
                        Text("$ ")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 13))
                        +
                        Text(product.formatPrice())
                            .foregroundColor(.white)
                            .font(.system(size: 13))
                    }

                }
                
                // Bottom HStack for Location and date
                HStack  {
                    Text(product.formatLocation())
                        .foregroundColor(.lightGrey)
                        .font(.caption)
                        .fontWeight(.thin)
                        .minimumScaleFactor(0.75)
                    
                    Spacer()
                    
                    Group {
                        Text("Date:")
                            .foregroundColor(.lightGrey)
                            .font(.caption)
                            .fontWeight(.thin)
                        +
                        Text(product.formatDate())
                            .foregroundColor(.lightGrey)
                            .font(.caption)
                            .fontWeight(.regular)
                    }
                    .minimumScaleFactor(0.75)
                        
                }
                
                Text(product.discription)
                    .foregroundColor(.white.opacity(0.6))
                    .font(.caption)
                    .fontWeight(.thin)
            }
            .padding()
        }
        .frame(width: 210, height: 150)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Product.example)
    }
}
