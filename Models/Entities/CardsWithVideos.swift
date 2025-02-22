//
//  CardsWithVideos.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import AVFoundation
import RealityKit



struct CardsWithVideos {
    @MainActor private static var playerLooper: AVPlayerLooper?
    @MainActor static func cardsWithVideos(video: String, name: String, description: String) -> ModelEntity {
        
        let cardWithVideosEntity = ModelEntity()
        
        let fileURL = video
        guard let url = Bundle.main.url(forResource: fileURL, withExtension: "mp4") else {
            fatalError("Video not found")
        }
        let playerItem = AVPlayerItem(url: url)
        let queuePlayer = AVQueuePlayer(playerItem: playerItem)
        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        queuePlayer.play()
        
        let videoMaterial = VideoMaterial(avPlayer: queuePlayer)
        let videoMesh = MeshResource.generatePlane(width: 1.0, height: 0.6, cornerRadius: 6)
        let videoEntity = ModelEntity(mesh: videoMesh, materials: [videoMaterial])
        videoEntity.position = [0, 0.1, 0.001]
        videoEntity.generateCollisionShapes(recursive: true)
        cardWithVideosEntity.addChild(videoEntity)
        
        let nameTextMesh = MeshResource.generateText(name, extrusionDepth: 0.005, font: .systemFont(ofSize: 0.1), containerFrame: CGRect (x: 0, y: 0, width: 1, height: 0.2), alignment: .center, lineBreakMode: .byClipping)
        let textMaterial = UnlitMaterial(color: .yellow)
        let textEntity = ModelEntity(mesh: nameTextMesh, materials: [textMaterial])
        textEntity.position = [-0.5, 0.4, 0]
        cardWithVideosEntity.addChild(textEntity)
     
        let descriptionTextMesh = MeshResource.generateText(description, extrusionDepth: 0.005, font: .systemFont(ofSize: 0.05), containerFrame: .zero, alignment: .center, lineBreakMode: .byClipping)
        let desctiptionTextMaterial = UnlitMaterial(color: .yellow)
        let descriptionTextEntity = ModelEntity(mesh: descriptionTextMesh, materials: [desctiptionTextMaterial])
        descriptionTextEntity.position = [-0.75, -0.45, 0]
        
        cardWithVideosEntity.addChild(descriptionTextEntity)
        
        
        return cardWithVideosEntity
    }
}


