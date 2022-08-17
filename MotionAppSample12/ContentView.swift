//
//  ContentView.swift
//  MotionAppSample12
//
//  Created by cmStudent on 2022/08/04.
//

import SwiftUI

// あっちむいてほい: look this way

struct ContentView: View {
    @StateObject var viewModel = MotionManager.shared
    
    var body: some View {
        HomeView(viewModel: viewModel)
            .onAppear {
                viewModel.startQueueUpdates()
            }
    }
    
//    var body: some View {
//        VStack {
//
//            Text("Hello, world!")
//                .padding()
//
//            Text(viewModel.checkDirection())
//                .padding()
//
//            datas
//
//        }
//        .onAppear {
//            MotionManager.shared.startQueueUpdates()
//
//        }
//    }
//
//    var datas: some View {
//        VStack {
////            Text("pount: \(viewModel.atP)")
////            Text("roll: \(viewModel.atR)")
////            Text("yaw: \(viewModel.atY)\n")
////
////            Text("accX: \(viewModel.usX)")
////            Text("accY: \(viewModel.usY)")
////            Text("accZ: \(viewModel.usZ)\n")
//
//            Text("rotX: \(viewModel.roX)")
//            Text("rotY: \(viewModel.roY)")
//            Text("rotZ: \(viewModel.roZ)")
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
