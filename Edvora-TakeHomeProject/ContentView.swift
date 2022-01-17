//
//  ContentView.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var sectionHelper = SectionHelper()
    
    @State private var currentFilters: [(filter: Filter, value: String)]? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backGroundColor.ignoresSafeArea()

                VStack {
                    HStack {
                        Text("Edvora")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundColor(.white.opacity(0.87))
                        Spacer()
                    }
                    .padding(.horizontal)

                    HStack {
                        DropDownButton(sectionHelper: sectionHelper, title: "Filters")

                        Spacer()


                        ClearFilterButton(action: {
                            sectionHelper.sections.removeAll()
                            sectionHelper.buildSections()
                        })

                    }
                    .padding(.horizontal)


                    ScrollView {
                        ForEach(sectionHelper.sections) { section in
                            ProductTabs(section: section)
                                .frame(minHeight: 250)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarHidden(true)

        }
        .onAppear {
            sectionHelper.buildSections()
        }
        
        
        
        // Testing Geometry Reader in scrollview
        
//        ProductTabs()
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
