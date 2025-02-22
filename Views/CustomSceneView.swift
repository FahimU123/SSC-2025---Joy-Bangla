//
//  CustomSceneView.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import SwiftUI
import SceneKit


struct CustomSceneView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = false
        view.antialiasingMode = .multisampling2X
        view.scene = FlagScene()
        view.backgroundColor = .clear
        
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
}


class FlagScene: SCNScene {
    override init() {
        super.init()
        setupHomeFlag()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHomeFlag() {
        
        let flagPlane = SCNPlane(width: 1.5, height: 0.75)
        flagPlane.firstMaterial?.diffuse.contents = UIImage(named: "flag.png")
        flagPlane.firstMaterial?.isDoubleSided = true
        let flagNode = SCNNode(geometry: flagPlane)
        rootNode.addChildNode(flagNode)
        
        let poleGeometry = SCNCylinder(radius: 0.05, height: 2.5)
        poleGeometry.firstMaterial?.diffuse.contents = UIColor.black
        let poleNode = SCNNode(geometry: poleGeometry)
        poleNode.position = SCNVector3(-0.8, -0.75, 0)
        flagNode.addChildNode(poleNode)
        
    }
}
