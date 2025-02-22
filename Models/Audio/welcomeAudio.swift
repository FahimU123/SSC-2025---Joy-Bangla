//
//  WelcomeAudio.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import AVFoundation


class WelcomeAudio {
    @MainActor private static var player: AVAudioPlayer?
    
    @MainActor static func playAudio() {
        guard let path = Bundle.main.url(forResource: "welcomeAudio", withExtension: "m4a") else {
            return }
        let url = URL(fileURLWithPath: path.path)
        
        do {
            player =  try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
