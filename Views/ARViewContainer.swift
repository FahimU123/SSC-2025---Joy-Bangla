//
//  ARViewContainer.swift
//  SSC 2025 - Joy Bangla
//
//  Created by Fahim Uddin on 2/17/25.
//

import ARKit
import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let configuartion = ARWorldTrackingConfiguration()
        configuartion.planeDetection = [.horizontal, .vertical]
        arView.session.run(configuartion)
        let anchor = AnchorEntity(world: [0, 0, -1])
        arView.scene.addAnchor(anchor)
        
        let titleEntity = Title.title(text: "JOY BANGLA")
        titleEntity.position = [-0.5, 1, -3]
        anchor.addChild(titleEntity)
   
        let flagEntity = Flag.flag()
        flagEntity.position = [-0.55, 0.5, -3]
        anchor.addChild(flagEntity)
        arView.installGestures([.translation, .rotation], for: flagEntity)
        
        let mapEntity = Map.map()
        mapEntity.position = [0.55, 0.5, -3]
        anchor.addChild(mapEntity)
        arView.installGestures([.translation, .rotation], for: mapEntity)
        
        let vehicleOneEntity = CardsWithImages.cardsWithImages(image: "CNG", name: "CNG", description: "Known as the pulse of Dhaka, a fleet of vibrant CNG vehicles\n powered by compressed natural gas weaves through crowded streets. \n Their steady hum and colorful presence embody the spirit of\nsustainable urban transit, energizing the city's rhythm.")
        vehicleOneEntity.position = [-1.8, 1.65, -3]
        anchor.addChild(vehicleOneEntity)
        arView.installGestures([.translation, .rotation], for: vehicleOneEntity)
        
        let vehicletTwoEntity = CardsWithImages.cardsWithImages(image: "rickshaw", name: "Rickshaw", description: "Known as the living canvases of the city, rickshaws\n navigate narrow alleys and bustling bazaars, each one adorned with local art\n and character. They offer intimate, winding journeys that capture\n the heartbeat and heritage of urban life.")
        vehicletTwoEntity.position = [1.8, 1.65, -3]
        anchor.addChild(vehicletTwoEntity)
        arView.installGestures([.translation, .rotation], for: vehicletTwoEntity)
        
        let locationOneEntity = CardsWithImages.cardsWithImages(image: "jaflong",name: "Jaflong", description: "Nestled in Sylhet's highlands, Jaflong features\n emerald tea gardens, misty rainforests,\n and the crystal-clear Dawki River.\n A cultural hub of the Khasi tribe, known for stone collecting.")
        locationOneEntity.position = [-4, -0.65, -3]
        anchor.addChild(locationOneEntity)
        arView.installGestures([.translation, .rotation], for: locationOneEntity)

        let locationTwoEntity = CardsWithImages.cardsWithImages(image: "tea garden",name: "Tea Gardens", description: "Scenic, lush plantations in Bangladesh’s hills, featuring\n colonial bungalows and peaceful trails,\n showcasing the country’s rich tea heritage.")
        locationTwoEntity.position = [-2, -0.65, -3]
        anchor.addChild(locationTwoEntity)
        arView.installGestures([.translation, .rotation], for: locationTwoEntity)

        let locationThreeEntity = CardsWithVideos.cardsWithVideos(video: "cox bazar video", name: "Cox Bazar Beach", description: "Stretching 120km, the world's longest natural sea beach,\n famed for golden sands, serene tides, and vibrant local culture.\n Offers swimming, surfing, and sunset strolls.")
        locationThreeEntity.position = [0, -0.65, -3]
        anchor.addChild(locationThreeEntity)
        arView.installGestures([.translation, .rotation], for: locationThreeEntity)
        
        let locationFourEntity = CardsWithImages.cardsWithImages(image: "Keane Bridge", name: "Keane Bridge", description: "An iconic arch bridge spanning the Surma River,\n blending colonial heritage with modern Sylhet.\n Now a pedestrian promenade offering panoramic river views.")
        locationFourEntity.position = [2, -0.65, -3]
        anchor.addChild(locationFourEntity)
        arView.installGestures([.translation, .rotation], for: locationFourEntity)
        
        let locationFiveEntity = CardsWithImages.cardsWithImages(image: "ratargul-swamp-forest", name: "Ratargul Swamp Forest", description: "Known as the Sundarbans of Sylhet,\na freshwater swamp forest with Dalbergia trees rising from the water.\nHome to diverse wildlife and best explored by boat.")
        locationFiveEntity.position = [4, -0.65, -3]
        anchor.addChild(locationFiveEntity)
        arView.installGestures([.translation, .rotation], for: locationFiveEntity)
        
        let streetFoodOneEntity = CardsWithImages.cardsWithImages(image: "jhalmuri", name: "Jhalmuri", description: "A crunchy, savory street snack—a vibrant mix of puffed rice\ntossed with zesty spices, peanuts, and a splash of mustard oil.\nEach mouthful captures the spirited essence of Bangladeshi flavor.")
        streetFoodOneEntity.position = [-2.5, 0.5, -3]
        anchor.addChild(streetFoodOneEntity)
        arView.installGestures([.translation, .rotation], for: streetFoodOneEntity)
        
        let streeFoodTwoEntity = CardsWithImages.cardsWithImages(image: "Panipuri", name: "Fuchka", description: "Tiny, crisp puris filled with a tangy blend of mashed potatoes, chickpeas,\nand tamarind water. A sprinkle of mint and chaat masala adds an extra kick,\nturning every bite into a playful explosion of flavors.")
        streeFoodTwoEntity.position = [-5, 0.5, -3]
        anchor.addChild(streeFoodTwoEntity)
        arView.installGestures([.translation, .rotation], for: streeFoodTwoEntity)
        
        let streetFoodThreeEntity = CardsWithImages.cardsWithImages(image: "Gulab Jamun", name: "Gulab Jamun", description: "A modern twist on a timeless classic—light, spongy dumplings bathed\nin rose-scented syrup with hints of cardamom.\nTheir melt-in-your-mouth texture and vibrant sweetness\nmake for a decadent, delightful finale.")
        streetFoodThreeEntity.position = [2.5, 0.5, -3]
        anchor.addChild(streetFoodThreeEntity)
        arView.installGestures([.translation, .rotation], for: streetFoodThreeEntity)
        
        let streetFoodFourEntity = CardsWithImages.cardsWithImages(image: "jalebi", name: "Jalebi", description: "Delicately spiraled, deep-fried ribbons of batter soaked\nin a fragrant sugar syrup. Crisp on the outside yet\ntender within, each bite delivers\na burst of sweet, saffron-kissed delight.")
        streetFoodFourEntity.position = [5, 0.5, -3]
        anchor.addChild(streetFoodFourEntity)
        arView.installGestures([.translation, .rotation], for: streetFoodFourEntity)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
}

