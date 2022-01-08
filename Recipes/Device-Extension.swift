//
//  Device-Extension.swift
//  Custom-TabBar
//
//  Created by braindamage on 2021/8/5.
//


import Foundation
import UIKit
extension UIDevice {
    //刘海屏， 获取底部高度
    static func getBottomHeight() -> CGFloat {
        
        //底部SafeArea的高度吗?
        var tabHeight = UIApplication.shared.statusBarFrame.size.height > 20 ? 34.0 : 0.0
        return CGFloat(tabHeight)
        
    }
    
}

