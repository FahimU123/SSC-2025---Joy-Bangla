//
//  SwiftUIView.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/19/25.
//

import SwiftUI

struct PopupView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let instructions: [(symbol: String, text: String)] = [  ("house", "If you don't see anything then go back to the Home\nScreen and click the explore button again as instructed"), ("rotate.left", "Use landscape mode for the best experience"), ("figure.walk", "Walk around and explore for a better viewing experience"), ("hand.wave", "Cover camera with your hand to enhance text"), ("hand.draw", "Pinch with both fingers to rotate"), ("arrow.left.and.right", "Drag horizontally with one finger to move left and right"), ("arrow.up.and.down", "Drag vertically with one finger to zoom") ]
    
    var body: some View {
        let dynamicHStack = dynamicTypeSize <= .xLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        ScrollView(showsIndicators: true) {
            
            ForEach(instructions, id: \.text) { instruction in
                dynamicHStack {
                    Image(systemName: instruction.symbol)
                        .padding(.top, 20)
                    
                    Text(instruction.text)
                        .font(.custom("Avenir", size: 20))
                        .multilineTextAlignment(.leading)
                }
            }
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 12))
            
        }
    }
}

#Preview {
    PopupView()
}



