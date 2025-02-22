//
//  HomeView.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import SwiftUI
import SceneKit

struct HomeView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    
    let instructions: [(symbol: String, text: String)] = [ ("arrow.up.and.down", "Drag the 3D Flag above to Interact,if\nit does not show up please restart the app"), ("camera", "Point the camera at a wall BEFORE\npressing the explore button"), ("speaker.wave.3", "Make sure your volume is turned on")
    ]
    
    var body: some View {
        
        let dynamicVStack = dynamicTypeSize <= .xLarge ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
        
        let dynamicHStack = dynamicTypeSize <= .xLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        NavigationStack {
            ZStack {
                CustomSceneView()
                dynamicVStack {
                    
                    Text("JOY BANGLA")
                        .font(.custom("Avenir", size: 40))
                        .padding(.bottom, 450)
                        .bold()
                    
                    Text("INSTRUCTIONS")
                            .font(.custom("Avenir", size: 48))
                            .padding(.bottom, 10)
                    
                    Text("  MUST READ \(Image(systemName: "exclamationmark.triangle"))  ")
                        .foregroundStyle(.red)
                        .bold()
                        .background(Color.orange.opacity(0.7), in: .rect(cornerRadius: 12))
                        .font(.custom("Avenir", size: 48))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 6))
                        .padding(.all, 50)
                    
                    Text(" Scroll For More Info ")
                        .font(.custom("Avenir", size: 20))
                        .padding(.horizontal, 6)
                        .background(.ultraThickMaterial, in: .rect(cornerRadius: 12))
                        

                    ScrollView {
                        
                        ForEach(instructions, id: \.text) { instruction in
                            dynamicHStack {
                                Image(systemName: instruction.symbol)
                                    .padding(.top, 20)
                                
                                Text(instruction.text)
                                    .font(.custom("Avenir", size: 20))
                                    .multilineTextAlignment(.leading)
                            }
    
                        }
                        
                        NavigationLink("Explore!") {
                            exploreAction()
                        }
                        .accessibilityLabel("Explore")
                        .accessibilityHint(Text("Tap to navigate to the next screen"))
                        .buttonStyle(PrimaryButtonStyle())
                        .padding(.vertical, 30)
                    }
                    
                }
                
            }
        }
        .accentColor(.blue)
        .font(.custom("Avenir", size: 50))
        
        
    }
    
    func exploreAction() -> some View {
        ContentView()
    }
}


#Preview {
    HomeView()
}


