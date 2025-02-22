//
//  InstructionsView.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import SwiftUI

struct InstructionsView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let symbol: String
    let text: String
    
    var body: some View {
        let dynamicHStack = dynamicTypeSize <= .xLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
                
        dynamicHStack {
            Image(systemName: symbol)
                .padding()
                          
            Text(text)
                
        }
    }
}




// is my flag
