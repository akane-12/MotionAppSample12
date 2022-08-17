//
//  MotionManager.swift
//  MotionAppSample12
//
//  Created by cmStudent on 2022/08/04.
//

import Foundation
import CoreMotion

final class MotionManager: NSObject, ObservableObject {
    
    private override init(){}
    static let shared: MotionManager = .init()
    private let motion = CMMotionManager()
    private let queue = OperationQueue()
    
    //    // 角度
    //    @Published var atP = 0.0
    //    @Published var atR = 0.0
    //    @Published var atY = 0.0
    //
    //    // かそく
    //    @Published var usX = 0.0
    //    @Published var usY = 0.0
    //    @Published var usZ = 0.0
    
    // 回転
    @Published var roX = 0.0
    @Published var roY = 0.0
    @Published var roZ = 0.0
    
    @Published var isShowGameView = false
    
    @Published var nowGame = 0
    
    @Published var choiceHand = -1
    
    @Published var choiceWay = -1
    
    @Published var isAiko = false
    
    func checkDirection() -> String {
        var result = ""
        
        if roZ > 2 {
            // 左
            result = "ひだり"
            
        } else if roZ < -2 {
            // 右
            result = "みぎ"
            
        } else if roX > 1.8 {
            // 上
            result = "うえ"
            
        } else if roX < -1.9 {
            // 下
            result = "した"
            
        }
        
        return result
        
    }
    
    func startQueueUpdates() {
        guard motion.isDeviceMotionAvailable else { return }
        
        // 更新間隔
        self.motion.deviceMotionUpdateInterval = 0.3
        
        // おまじな
        self.motion.showsDeviceMovementDisplay = true
        
        
        self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: queue) { data, error in
            if let validData = data {
                
                // TODO: スレッドの疑問
                DispatchQueue.main.async {
                    
                    //                    self.atP = validData.attitude.pitch
                    //                    self.atR = validData.attitude.roll
                    //                    self.atY = validData.attitude.yaw
                    //
                    //                    self.usX = validData.userAcceleration.x
                    //                    self.usY = validData.userAcceleration.y
                    //                    self.usZ = validData.userAcceleration.z
                    
                    self.roX = validData.rotationRate.x
                    self.roY = validData.rotationRate.y
                    self.roZ = validData.rotationRate.z
                    
                    if self.nowGame == 1 && self.roX < -2 {
                        print("1 -> 2")
                        self.nowGame = 2
                    } else if self.nowGame == 3 {
                        
                        if self.roZ > 2 {
                            // 左
                            self.choiceWay = 3
                            self.nowGame = 4
                            print("3 -> 4")
                            
                        } else if self.roZ < -2 {
                            // 右
                            self.choiceWay = 1
                            self.nowGame = 4
                            print("3 -> 4")
                            
                        } else if self.roX > 1.8 {
                            // 上
                            self.choiceWay = 0
                            self.nowGame = 4
                            print("3 -> 4")
                            
                        } else if self.roX < -1.9 {
                            // 下
                            self.choiceWay = 2
                            self.nowGame = 4
                            print("3 -> 4")
                            
                        }
                    }
                }
                
                
                
                
                //                // 角度
                //                print(validData.attitude.pitch >= 0 ? "角度x:  \(validData.attitude.pitch)" : "角度x: \(validData.attitude.pitch)")
                //                print(validData.attitude.roll >= 0 ? "角度y:  \(validData.attitude.roll)" : "角度y: \(validData.attitude.roll)")
                //                print(validData.attitude.yaw >= 0 ? "角度z:  \(validData.attitude.yaw)" : "角度z: \(validData.attitude.yaw)")
                //                print("")
                
                //                // 加速度
                //                print(validData.userAcceleration.x >= 0 ? "加速度x:  \(validData.userAcceleration.x)" : "加速度x: \(validData.userAcceleration.x)")
                //                print(validData.userAcceleration.y >= 0 ? "加速度y:  \(validData.userAcceleration.y)" : "加速度y: \(validData.userAcceleration.y)")
                //                print(validData.userAcceleration.z >= 0 ? "加速度z:  \(validData.userAcceleration.z)" : "加速度z: \(validData.userAcceleration.z)")
                //                print("")
                //
                //                // 回転速度
                //                print(validData.rotationRate.x >= 0 ? "回転x:  \(validData.rotationRate.x)" : "回転x: \(validData.rotationRate.x)")
                //                print(validData.rotationRate.y >= 0 ? "回転y:  \(validData.rotationRate.y)" : "回転y: \(validData.rotationRate.y)")
                //                print(validData.rotationRate.z >= 0 ? "回転z:  \(validData.rotationRate.z)" : "回転z: \(validData.rotationRate.z)")
                //                print("")
                //
                //                // 重力
                //                print(validData.gravity.x >= 0 ? "重力x:  \(validData.gravity.x)" : "重力x: \(validData.gravity.x)")
                //                print(validData.gravity.y >= 0 ? "重力y:  \(validData.gravity.y)" : "重力y: \(validData.gravity.y)")
                //                print(validData.gravity.z >= 0 ? "重力z:  \(validData.gravity.z)" : "重力z: \(validData.gravity.z)")
                //                print("")
                //
                //                // コンパス
                //                print(validData.magneticField.field.x >= 0 ? "コンパスx:  \(validData.magneticField.field.x)" : "コンパスx: \(validData.magneticField.field.x)")
                //                print(validData.magneticField.field.y >= 0 ? "コンパスy:  \(validData.magneticField.field.y)" : "コンパスy: \(validData.magneticField.field.y)")
                //                print(validData.magneticField.field.z >= 0 ? "コンパスz:  \(validData.magneticField.field.z)" : "コンパスz: \(validData.magneticField.field.z)")
                //
                //                print("---------------")
                
            }
        }
        
    }
    
    func choiceHandImage() -> String {
        
        switch choiceHand {
        case 0:
            return "gu"
        case 1:
            return "tyoki"
        case 2:
            return "pa"
        default:
            return ""
        }
    }
    
    func choiceWayAngle() -> Double {
        
        switch choiceWay {
        case 0:
            return 0
        case 1:
            return 90
        case 2:
            return 180
        case 3:
            return 270
        default:
            return 0
        }
    }
    
    func gameInit() {
        nowGame = 0
        choiceHand = -1
        choiceWay = -1
        isAiko = false
    }
}



