//
//  Flag.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import RealityKit

struct Flag {
    @MainActor static func flag() -> ModelEntity {
        
        let flagmesh = MeshResource.generatePlane(width: 1.0, height: 0.5)
        let texture = try! TextureResource.load(named: "flag")
        var material = UnlitMaterial()
        material.color = .init(texture: .init(texture))
        let entity = ModelEntity(mesh: flagmesh, materials: [material])
        entity.generateCollisionShapes(recursive: true)
        
        return entity
    }
}
