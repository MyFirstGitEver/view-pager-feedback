//
//  ColorGetter.swift
//  view-pager
//
//  Created by FVFH4069Q6L7 on 23/08/2023.
//

import Foundation
import UIKit

extension UIColor {
    private static func getInt(fromHex rawHexString: String) -> UInt {
            let hexString = rawHexString.filter({ "0123456789abcdefABCDEF".contains($0) }).prefix(8)

            var color: UInt64 = 0
            let scanner = Scanner(string: String(hexString))
            scanner.scanHexInt64(&color)

            return UInt(color)
        }

        convenience init(rgbHexString hexString: String, a alpha: CGFloat = 1.0) {
            let int = UIColor.getInt(fromHex: hexString)
            let color = int & 0xFFFFFF
            self.init(int & color, a: alpha)
        }

        convenience init(rgbaHexString hexString: String) {
            let int = UIColor.getInt(fromHex: hexString)
            let color = int & 0xFFFFFF
            let alpha = CGFloat((int >> 6) & 0xFF) / 255
            self.init(int & color, a: alpha)
        }
        
        private convenience init(_ rgb: UInt, a: CGFloat = 1.0) {
            self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat((rgb & 0x0000FF)) / 255.0,
                      alpha: a)
        }
}

class ColorGetter {
    static let getter = ColorGetter()
    
    func getBackgroundColor(isLight: Bool) -> UIColor {
        if isLight {
            return UIColor(rgbaHexString: "#F0F2F5")
        }
        
        return UIColor(rgbaHexString: "#121212")
    }
    
    func getForegroundColor(isLight: Bool) -> UIColor {
        if isLight {
            return UIColor(rgbaHexString: "#121217")
        }
        
        return UIColor(rgbaHexString: "#FAFAFA")
    }
}
