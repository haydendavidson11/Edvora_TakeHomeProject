//
//  ScrollOffsetPreferenceKey.swift
//  Edvora-TakeHomeProject
//
//  Created by Hayden Davidson on 1/11/22.
//

import Foundation
import SwiftUI

// Gives the ProductCard view a preference key to observe the position of each ProductCard inside the scroll view.


struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}



