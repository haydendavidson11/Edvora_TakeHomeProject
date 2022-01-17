//
//  DropDownMenu.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/11/22.
//

import SwiftUI

struct DropDownMenu: View {
    @ObservedObject var sectionHelper: SectionHelper
    
    var body: some View {
        ZStack {
            Color.darkGray
                .cornerRadius(15)
            
            
                VStack {
                    VStack(alignment: .leading) {
                        Text("Filters")
                            .foregroundColor(.lightGrey)
                            .fontWeight(.thin)
                       
                        Rectangle()
                            .foregroundColor(.dividerColor)
                            .frame(height: 1)
                    }
                    .padding([.horizontal, .bottom])
                        
                
                
                ForEach(Filter.allCases, id: \.self) { filter in
                    DropDownButton(sectionHelper: sectionHelper, title: filter.rawValue)
                        .padding(3)
                }
            }
            .padding()
        }
        .frame(width: 228, height: 282)
        
    }
}

struct DropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenu(sectionHelper: SectionHelper())
    }
}
