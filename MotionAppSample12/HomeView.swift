//
//  HomeView.swift
//  MotionAppSample12
//
//  Created by cmStudent on 2022/08/16.
//

import SwiftUI

struct HomeView: View {
    
    // TODO: ロゴ等の作成（できればSVG）
    
    @ObservedObject var viewModel: MotionManager
    
    var body: some View {
        VStack {
            Image("taitoru")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            
            // TODO: CPU対戦モード
//            Button {
//
//            } label: {
//                Text("ひとりで")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//                    .frame(width: 300, height: 50)
//                    .background(Color.orange)
//                    .clipShape(Capsule())
//                    .padding()
//
//            }
            
            
            Button {
                viewModel.isShowGameView = true
            } label: {
                Text("ふたりで")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .clipShape(Capsule())
            }
            .fullScreenCover(isPresented: $viewModel.isShowGameView) {
                GameView(viewModel: viewModel)
            }
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MotionManager.shared)
    }
}
