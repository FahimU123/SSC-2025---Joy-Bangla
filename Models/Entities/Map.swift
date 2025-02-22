//
//  Map.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import RealityKit

struct Map {
    @MainActor
    static func map() -> ModelEntity {
        
        let mesh = MeshResource.generatePlane(width: 1.0, height: 0.5)
        guard let textureResource = try? TextureResource.load(named: "Map") else {
            fatalError("Failed to load texture named 'Map'")
        }
        var material = UnlitMaterial()
        material.color = .init(texture: .init(textureResource))
        let entity = ModelEntity(mesh: mesh, materials: [material])
        entity.generateCollisionShapes(recursive: true)
        
        return entity
    }
}
