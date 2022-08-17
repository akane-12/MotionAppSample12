//
//  GameView.swift
//  MotionAppSample12
//
//  Created by cmStudent on 2022/08/16.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel: MotionManager
    
    var body: some View {
        
        if viewModel.nowGame == 0 {
            game0
        } else if viewModel.nowGame == 1 {
            game1
        } else if viewModel.nowGame == 2 {
            game2
        } else if viewModel.nowGame == 3 {
            game3
        } else if viewModel.nowGame == 4 {
            game4
        }
    }
    
    var game0: some View {
        VStack {
            Spacer()
            
            Image("hatena")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 4)
                .padding()
            
            Spacer()
            
            Text("えらべ!")
                .font(.largeTitle)
                .frame(height: UIScreen.main.bounds.size.height / 8)
                .padding()
            
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        viewModel.choiceHand = 0
                    } label: {
                        Image("gu")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .saturation(viewModel.choiceHand == 0 ? 1 : 0)
                    }
                    
                    Spacer()
                    
                    Button {
                        viewModel.choiceHand = 1
                    } label: {
                        Image("tyoki")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .saturation(viewModel.choiceHand == 1 ? 1 : 0)
                    }
                    
                    Spacer()
                    
                    Button {
                        viewModel.choiceHand = 2
                    } label: {
                        Image("pa")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .saturation(viewModel.choiceHand == 2 ? 1 : 0)
                    }
                    
                    Spacer()
                }
                Spacer()
                
                Button {
                    if viewModel.choiceHand != -1 {
                        viewModel.nowGame = 1
                    }
                } label: {
                    Text("OK！")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(viewModel.choiceHand != -1 ? Color.orange : Color.gray)
                        .clipShape(Capsule())
                        .padding()
                }
            }
            .frame(height: UIScreen.main.bounds.size.height / 4)
            
            Spacer()
        }
    }
    
    var game1: some View {
        VStack {
            Spacer()
            
            Image(viewModel.choiceHandImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 4)
                .padding()
            
            Spacer()
            
            Text(viewModel.isAiko ? "あいこで・・・" : "じゃんけん・・・")
                .font(.largeTitle)
                .frame(height: UIScreen.main.bounds.size.height / 8)
                .padding()
            
            Spacer()
            
            HStack {
                // TODO: 説明画像
                Text("スマホを前にたおす")
            }
            .frame(height: UIScreen.main.bounds.size.height / 4)
            
            Spacer()
        }
    }
    
    var game2: some View {
        VStack {
            Spacer()
            
            VStack {
            Image(viewModel.choiceHandImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 3)

            }
            .frame(height: UIScreen.main.bounds.size.height / 4)
            .padding()
            
            Spacer()
            
            Text("ポン!!!")
                .font(.largeTitle)
                .frame(height: UIScreen.main.bounds.size.height / 8)
                .padding()
            
            Spacer()
            
            VStack {
                
                Button {
                    viewModel.nowGame = 0
                    viewModel.isAiko = true
                } label: {
                    Text("あいこ・・・")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .clipShape(Capsule())
                        .padding()
                }
                
                
                Button {
                    viewModel.nowGame = 3
                } label: {
                    Text("次へ")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .clipShape(Capsule())
                }
            }
            .frame(height: UIScreen.main.bounds.size.height / 4)
            
            Spacer()
        }
    }
    
    var game3: some View {
        VStack {
            Spacer()
            
            HStack {
                VStack {
                    Spacer()
                    Image("yazirusi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(270))
                    Spacer()
                }
                
                VStack {
                    Image("yazirusi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Image("yazirusi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(180))
                }
                
                VStack {
                    Spacer()
                    Image("yazirusi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(90))
                    Spacer()
                }
                
            }
            
            Spacer()
            
            Text("あっちむいて・・・")
                .font(.largeTitle)
                .frame(height: UIScreen.main.bounds.size.height / 8)
                .padding()
            
            Spacer()
            
            HStack {
                // TODO: 説明画像
                Text("スマホを振る")
            }
            .frame(height: UIScreen.main.bounds.size.height / 4)
            
            Spacer()
        }
    }
    
    var game4: some View {
        VStack {
            Spacer()
            
            Image("yazirusi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 4)
                .rotationEffect(.degrees(viewModel.choiceWayAngle()))
                .padding()
            
            Spacer()
            
            Text("ホイ!!!")
                .font(.largeTitle)
                .frame(height: UIScreen.main.bounds.size.height / 8)
                .padding()
            
            Spacer()
            
            VStack {
                Button {
                    viewModel.gameInit()
                } label: {
                    Text("もう一回")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .clipShape(Capsule())
                        .padding()
                }
                
                Button {
                    viewModel.gameInit()
                    viewModel.isShowGameView = false
                } label: {
                    Text("タイトルへ")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.orange)
                        .clipShape(Capsule())
                }
            }
            .frame(height: UIScreen.main.bounds.size.height / 4)
            
            Spacer()
        }
    }
    
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: MotionManager.shared)
    }
}
