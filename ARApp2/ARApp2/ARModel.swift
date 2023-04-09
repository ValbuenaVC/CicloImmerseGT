//
//  ARModel.swift
//  ARApp2
//
//  Created by Victor Valbuena on 4/8/23.
//

import Foundation
import RealityKit
import ARKit

enum typeMaterial {
    case metal, glass, paper, noMaterial
    
    var description: String {
        switch self {
        case .glass:
            return "glass"
        case .metal:
            return "metal"
        case .paper:
            return "paper"
        case .noMaterial:
            return "none"
        }
    }
}

struct ARModel {
    private (set) var arView: ARView
    var imageRecognizedVar = false
    var typeDetected = typeMaterial.noMaterial
    
    
    init() {
        arView = ARView(frame: .zero)
        
        guard let trackerImage = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = trackerImage
        arView.session.run(configuration)
    }
    
    mutating func imageRecognized(anchors: [ARAnchor]) {
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        for anchor in anchors {
            guard let imageAnchor = anchor as? ARImageAnchor else {
                typeDetected = .noMaterial
                return
            }
            
            var referenceImage = imageAnchor.referenceImage.name ?? "trash"
            
            switch referenceImage {
                case "metal":
                    typeDetected = .metal
                case "glass":
                    typeDetected = .glass
                case "paper":
                    typeDetected = .paper
                default:
                    typeDetected = .noMaterial
            }
            
            imageRecognizedVar = true
            
            
            
            
            
            
//            typeDetected = .something

            
        }
        
    }
    
    
    
}
