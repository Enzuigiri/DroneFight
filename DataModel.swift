//
//  DataModel.swift
//  DroneFight
//
//  Created by Enzu Ao on 24/05/23.
//

import Combine
import RealityKit

final class DataModel: ObservableObject {
    static var shared = DataModel()
    @Published var arView: ARView!
   
    
    func upButtonTrigger() {
        if let boxAnchor = arView.scene.anchors[0] as? Experience.Box {
            boxAnchor.notifications.goingUp.post()
        }
    }
    
    func shootButtonTrigger() {
        if let boxAnchor = arView.scene.anchors[0] as? Experience.Box {
            boxAnchor.notifications.shoot.post()
        }
    }
    
    func downButtonTrigger() {
        if let boxAnchor = arView.scene.anchors[0] as? Experience.Box {
            if boxAnchor.droneGroup!.transform.translation.y > 0 {
                boxAnchor.notifications.goingDown.post()
            }
        }
    }
    
    func forwardButtonTrigger() {
        if let boxAnchor = arView.scene.anchors[0] as? Experience.Box {
            boxAnchor.notifications.goingForward.post()
        }
    }
    
    func backButtonTrigger() {
        if let boxAnchor = arView.scene.anchors[0] as? Experience.Box {
            boxAnchor.notifications.goingBack.post()
        }
    }
    
    func leftButtonTrigger() {
        if let boxAnchor = arView.scene.anchors[0] as? Experience.Box {
            boxAnchor.notifications.goingLeft.post()
        }
    }
    
    func rightButtonTrigger() {
        if let boxAnchor = arView.scene.anchors[0] as? Experience.Box {
            boxAnchor.notifications.goingRight.post()
        }
    }
    
    init() {
        arView = ARView(frame: .zero)
        
        let boxAnchor = try! Experience.loadBox()
        
        arView.scene.anchors.append(boxAnchor)
    }
    
}
