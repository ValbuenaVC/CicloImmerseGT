//
//  ARViewModel.swift
//  ARApp2
//
//  Created by Victor Valbuena on 4/8/23.
//

import Foundation
import RealityKit
import ARKit

class ARViewModel: UIViewController, ObservableObject, ARSessionDelegate {
//    @Published private var model: ARModel = ARModel()
    @Published var model: ARModel = ARModel()
    
    var arView : ARView { model.arView }
    

    var imageRecognizedVar : Bool {
        if(model.imageRecognizedVar) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.model.imageRecognizedVar = false
            }
            
        }

        return model.imageRecognizedVar
    }
  
//    var imageRecognizedVar : Bool { model.imageRecognizedVar }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        model.imageRecognized(anchors: anchors)
        for anchor in anchors {
            model.arView.session.remove(anchor: anchor)
        }
    }
}
