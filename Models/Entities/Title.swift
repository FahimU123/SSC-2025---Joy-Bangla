//
//  Title.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import RealityKit

struct Title {
    @MainActor static func title(text: String) -> ModelEntity {
        
        let flagEntity = ModelEntity()
        
        let mesh = MeshResource.generateText(text, extrusionDepth: 0.001, font: .systemFont(ofSize: 0.2), containerFrame: .zero, alignment: .center)
        let material = UnlitMaterial(color: .yellow)
        let textEntity = ModelEntity(mesh: mesh, materials: [material])
        flagEntity.addChild(textEntity)
        textEntity.generateCollisionShapes(recursive: true)
        
        return flagEntity
    }
}



