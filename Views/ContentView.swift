import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var audioPlayer: AVAudioPlayer?
    
    @State private var showPopup = false
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        

        let dynamicVStack = dynamicTypeSize <= .xLarge ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
        
        ZStack(alignment: .bottomTrailing) {
            ARViewContainer().edgesIgnoringSafeArea(.all)
                .onAppear {
                    WelcomeAudio.playAudio()
                }
            dynamicVStack{
    
                Button("\(Image(systemName: "info.circle"))") {
                    showPopup.toggle()
                }
                .buttonStyle(SecondaryButtonStyle())
                .accessibilityLabel("Tap For More Info")
                .accessibilityHint(Text("Tap to open additional information about the app"))
                .popover(isPresented: $showPopup) {
                    PopupView()
                    
                }
            }
            .padding(.bottom, 300)
            .padding(.horizontal, 8)
            
        }
    }
}



