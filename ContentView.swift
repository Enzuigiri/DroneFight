//
//  ContentView.swift
//  DroneFight
//
//  Created by Enzu Ao on 18/05/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    @EnvironmentObject var data: DataModel
    @State var upPressed: Bool = false
    var body: some View {
        ZStack{
            ARViewContainer().ignoresSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Button {
                            DataModel.shared.forwardButtonTrigger()
                            
                        } label: {
                            Text("⬆️")
                                .frame(minWidth: 100, minHeight: 40)
                        }
                        .buttonStyle(.bordered)
                        
                        HStack{
                            Spacer()
                            Button {
                                DataModel.shared.leftButtonTrigger()
                                
                            } label: {
                                Text("⬅️")
                                    .frame(width: 70, height: 40)
                            }
                            .buttonStyle(.bordered)
                            Spacer()
                            Button {
                                DataModel.shared.rightButtonTrigger()
                                
                            } label: {
                                Text("➡️")
                                    .frame(width: 70, height: 40)
                            }
                            .buttonStyle(.bordered)
                            Spacer()
                        }
                        .frame(minHeight: 50)
                        Button {
                            DataModel.shared.backButtonTrigger()
                            
                        } label: {
                            Text("⬇️")
                                .frame(minWidth: 100, minHeight: 40)
                        }
                        .buttonStyle(.bordered)
                    }
                    Divider()
                        .frame(maxHeight: 200)
                    VStack{
                        
                        Button {
                            DataModel.shared.upButtonTrigger()
                            
                        } label: {
                            Text("⬆️")
                                .frame(minWidth: 100, minHeight: 40)
                        }
                        .frame(minHeight: 50)
                        .buttonStyle(.borderedProminent)
                        Button {
                            DataModel.shared.shootButtonTrigger()
                            
                        } label: {
                            Text("💥")
                                .frame(minWidth: 100, minHeight: 40)
                        }
                        .frame(minHeight: 50)
                        .buttonStyle(.borderedProminent)
                        .tint(Color.red)
                        
                        Button {
                            DataModel.shared.downButtonTrigger()
                            
                        } label: {
                            Text("⬇️")
                                .frame(minWidth: 100, minHeight: 40)
                        }
                        .frame(minHeight: 50)
                        .buttonStyle(.borderedProminent)
                        
                        
                    }
                    .frame(minWidth: 150)
                    Spacer()
                    
                }
            }
            .background(.clear)
            .frame(minHeight: 250)
            
            
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        return DataModel.shared.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        let modelEntity = (DataModel.shared.arView.scene.anchors[0] as? Experience.Box)?.droneGroup
        modelEntity?.generateCollisionShapes(recursive: true)
        DataModel.shared.arView.installGestures([.rotation,.translation], for: modelEntity as! HasCollision)
        
    }
    
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
