//
//  PrimaryButtonStyle.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 100)
            .padding(.vertical, 15)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.0, green: 0.6, blue: 0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 5))
            .font(.custom("Avenir", size: 30))
            .foregroundColor(.white)
            .shadow(radius: 5)
         
            
    }
}
