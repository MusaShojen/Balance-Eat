//
//  Constants.swift
//  Balance Eat
//
//  Created by 123 on 08.01.24.
//

import Foundation
import SwiftUI

enum Fonts: String {
    case regular = "Lato-Regular"
    case black = "Lato-Black"
    // Добавьте другие шрифты по необходимости
    
    func size(_ size: CGFloat) -> Font {
        return Font.custom(rawValue, size: size) 
    }
}
