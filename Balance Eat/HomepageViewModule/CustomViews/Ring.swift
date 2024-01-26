//
//  Ring.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 16.01.2024.
//

import SwiftUI

struct Ring: View {
    let lineWidth: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let percent: Double
    
    var body: some View {
        GeometryReader {
            geometry in
            ZStack{
                RingShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgroundColor)
                
                RingShape(percent: percent)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(foregroundColor)
                
                
            }.padding(lineWidth/2)
            
        }
    }
}
