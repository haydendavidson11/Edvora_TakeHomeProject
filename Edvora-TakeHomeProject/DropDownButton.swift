//
//  DropDownButton.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/11/22.
//

import SwiftUI

struct DropDownButton: View {
    @ObservedObject var sectionHelper: SectionHelper
    
    @State private var open = false
    
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(.white)
                Spacer()
                Button {
                    withAnimation {
                        self.open.toggle()
                    }
                } label: {
                    Image(systemName: "arrowtriangle.forward.fill")
                        .rotationEffect(Angle(degrees: 90.0))
                        .foregroundColor(.lightGrey)
                        .controlSize(.mini)
                    
                }
                
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(Color.buttonColor)
            .cornerRadius(4.68)
            .frame(width: 168.45, height: 37.5)
            
            if open && title == "Filters" {
                withAnimation {
                    DropDownMenu(sectionHelper: sectionHelper)
                }
            }
            if open && title != "Filters" {
                withAnimation {
                    FilterPicker(sectionHelper: sectionHelper, filterType: title)
                }
            }
        }
        
        
    }
    
}

struct DropDownButton_Previews: PreviewProvider {
    static var previews: some View {
        DropDownButton(sectionHelper: SectionHelper(), title: "Products")
    }
}
