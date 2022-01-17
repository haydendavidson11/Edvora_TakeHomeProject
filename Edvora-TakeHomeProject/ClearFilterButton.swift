//
//  ClearFilterButton.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/11/22.
//

import SwiftUI

struct ClearFilterButton: View {
    var action: () -> Void
    
    var body: some View {
        Button {
            // Clear Filter
            action()
        } label: {
            Text("clear filter")
                .foregroundColor(.white)
        }
        .buttonStyle(.bordered)
        .foregroundColor(.lightGrey)
        .background(Color.buttonColor)
        .cornerRadius(4.68)
    }
}

struct ClearFilterButton_Previews: PreviewProvider {
    static var previews: some View {
        ClearFilterButton(action: {
            // no action yet
            
        })
    }
}
