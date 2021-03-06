//
//  Device + Ext.swift

import UIKit

extension UIDevice {
    
    static func getBottomHeight() -> CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let height = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0 > 20 ? 24.0 : 5.0
        return CGFloat(height)
    }
}

