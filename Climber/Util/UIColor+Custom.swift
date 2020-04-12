//
//  UIColor+Custom.swift
//  Climber
//
//  Created by 罗谨 on 2020/4/11.
//  Copyright © 2020 finger. All rights reserved.
//


import Foundation
import UIKit
extension UIColor {
    
    /// eg:  UIColor(hex: 0x50E3C2, alpha: 1.0)
    public convenience init(Hex: UInt32, alpha: CGFloat = 1.0) {
        let red     = CGFloat((Hex & 0xFF0000) >> 16) / 255.0
        let green   = CGFloat((Hex & 0x00FF00) >> 8 ) / 255.0
        let blue    = CGFloat((Hex & 0x0000FF)      ) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // 6或者8位hex字符串
    public convenience init(HexString: String) {
        // 如果有#前缀，去掉，如果长度超过或者小于6，返回默认颜色黑色
        var trimedStr = HexString
        if trimedStr.hasPrefix("#") {
            trimedStr = trimedStr.trimmingCharacters(in: CharacterSet.init(charactersIn: "#"))
        }
        if trimedStr.count != 6 && trimedStr.count != 8{
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        
        let scanner = Scanner(string: trimedStr)
        
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        if trimedStr.count == 6 {
            let r = (rgbValue & 0xff0000) >> 16
            let g = (rgbValue & 0xff00) >> 8
            let b = rgbValue & 0xff
            
            self.init(
                red: CGFloat(r) / 0xff,
                green: CGFloat(g) / 0xff,
                blue: CGFloat(b) / 0xff, alpha: 1
            )
        } else {
            let alpha = (rgbValue & 0xff000000) >> 24
            let r = (rgbValue & 0xff0000) >> 16
            let g = (rgbValue & 0xff00) >> 8
            let b = rgbValue & 0xff
            
            self.init(
                red: CGFloat(r) / 0xff,
                green: CGFloat(g) / 0xff,
                blue: CGFloat(b) / 0xff, alpha: CGFloat(alpha) / 0xff
            )
        }
    }
    
    /**
     获取颜色，通过16进制色值字符串，e.g. #ff0000， ff0000
     - parameter hexString  : 16进制字符串
     - parameter alpha      : 透明度，默认为1，不透明
     - returns: RGB
     */
    static func withHex(hexString hex: String, alpha:CGFloat = 1) -> UIColor {
        // 去除空格等
        var cString: String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        // 去除#
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        // 必须为6位
        if (cString.count != 6) {
            return UIColor.gray
        }
        // 红色的色值
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        // 字符串转换
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    /**
     获取颜色，通过16进制数值
     - parameter hexInt : 16进制数值
     - parameter alpha  : 透明度
     - returns : 颜色
     */
    static func withHex(hexInt hex:Int32, alpha:CGFloat = 1) -> UIColor {
        let r = CGFloat((hex & 0xff0000) >> 16) / 255
        let g = CGFloat((hex & 0xff00) >> 8) / 255
        let b = CGFloat(hex & 0xff) / 255
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    /**
     获取颜色，通过rgb
     - parameter red    : 红色
     - parameter green  : 绿色
     - parameter blue   : 蓝色
     - returns : 颜色
     */
    static func withRGB(_ red:CGFloat, _ green:CGFloat, _ blue:CGFloat) -> UIColor {
        return UIColor.withRGBA(red, green, blue, 1)
    }
    
    /**
     获取颜色，通过rgb
     - parameter red    : 红色
     - parameter green  : 绿色
     - parameter blue   : 蓝色
     - parameter alpha  : 透明度
     - returns : 颜色
     */
    static func withRGBA(_ red:CGFloat, _ green:CGFloat, _ blue:CGFloat, _ alpha:CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
    
    static func lineColor() -> UIColor {
        return UIColor(red: 246.0 / 255.0, green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    }
}
