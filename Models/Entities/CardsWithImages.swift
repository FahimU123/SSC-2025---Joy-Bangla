//
//  CardsWithImages.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import AVFoundation
import RealityKit

struct CardsWithImages {
    @MainActor static func cardsWithImages(image: String, name: String, description: String) -> ModelEntity {
        
        let cardEntity = ModelEntity()
        
        let imageMesh = MeshResource.generatePlane(width: 1.0, height: 0.6, cornerRadius: 3)
        let imageTexture = try! TextureResource.load(named: image)
        var imageMaterial = UnlitMaterial()
        imageMaterial.color = .init(texture: .init(imageTexture))
        let imageEntity = ModelEntity(mesh: imageMesh, materials: [imageMaterial])
        imageEntity.position = [0, 0.1, 0.001]
        imageEntity.generateCollisionShapes(recursive: true)
        cardEntity.addChild(imageEntity)
        
        let nameTextMesh = MeshResource.generateText(name, extrusionDepth: 0.005, font: .systemFont(ofSize: 0.1), containerFrame: CGRect (x: 0, y: 0, width: 1, height: 0.2), alignment: .center, lineBreakMode: .byClipping)
        let textMaterial = UnlitMaterial(color: .yellow)
        let textEntity = ModelEntity(mesh: nameTextMesh, materials: [textMaterial])
        textEntity.position = [-0.5, 0.4, 0]
        cardEntity.addChild(textEntity)
        
        let descriptionTextMesh = MeshResource.generateText(description, extrusionDepth: 0.005, font: .systemFont(ofSize: 0.05), containerFrame: .zero, alignment: .center, lineBreakMode: .byClipping)
        let desctiptionTextMaterial = UnlitMaterial(color: .yellow)
        let descriptionTextEntity = ModelEntity(mesh: descriptionTextMesh, materials: [desctiptionTextMaterial])
        descriptionTextEntity.position = [-0.75, -0.45, 0]
        cardEntity.addChild(descriptionTextEntity)
        
        return cardEntity
    }
}
