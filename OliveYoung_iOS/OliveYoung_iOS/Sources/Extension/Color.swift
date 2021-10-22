//
//  Color.swift
//  OliveYoung_iOS
//
//  Created by 김승찬 on 2021/05/17.
//

import Foundation
import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    class var mainPurple: UIColor { UIColor(hex: 0x5f0080) }
    class var mainGray : UIColor { UIColor(hex: 666666)}
    class var mainBlack2 : UIColor { UIColor(hex: 555555)}
    class var mainGray2 : UIColor { UIColor(hex: 949494)}
    
}




