//
//  ContentView.swift
//  ARApp2
//
//  Created by Victor Valbuena on 4/8/23.
//


import SwiftUI
import RealityKit


struct ContentView : View {
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    @State var statsSheetShowing = false
    
    var body: some View {
        VStack {
            ZStack {
                ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Is this recyclable?")
                    switch arViewModel.imageRecognizedVar {
                    case false: Text("No").foregroundColor(.red)
                    case true:
                        Text("Yes").foregroundColor(.green)
                        switch arViewModel.model.typeDetected.description {
                        case "metal":
                            Text("Please place metal in")
                            Text("Bin A")
                                .foregroundColor(.cyan)
                        case "glass":
                            Text("Please place glass in")
                            Text("Bin B")
                                .foregroundColor(.pink)
                        case "paper":
                            Text("Please place paper in")
                            Text("Bin C")
                                .foregroundColor(.yellow)
                        default:
                            Text(" ")
                        }
                        
                    }
                }.font(.title)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(.regularMaterial))
            }

            Spacer()
            Spacer()
            Spacer()
            Spacer()
//            Text(arViewModel.imageRecognizedVar.description)
//            Text(arViewModel.model.typeDetected.description)

            Button("See Statistics") {
                statsSheetShowing.toggle()
            }
            .tint(.mint)
            .buttonStyle(.bordered)
            .sheet(isPresented: $statsSheetShowing) {
                StatsView()
                    .presentationDragIndicator(.visible)
            }

            
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    
    func makeUIView(context: Context) -> ARView {
        arViewModel.startSessionDelegate()
        return arViewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
