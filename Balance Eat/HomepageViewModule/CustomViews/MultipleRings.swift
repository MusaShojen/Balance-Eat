//
//  MultipleRings.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 16.01.2024.
//

import SwiftUI

struct MultipleRings: View {
    let largestHeight: CGFloat
    @Binding var proteinPercentage: Double
    @Binding var carbsPercentage: Double
    @Binding var fatsPercentage: Double
    var body: some View {
        ZStack{
            
            Ring(lineWidth: 12, backgroundColor: Color.background, foregroundColor: Color.blue, percent: proteinPercentage)
                .frame(width: largestHeight, height: largestHeight)
            
            Ring(lineWidth: 12, backgroundColor: Color.background, foregroundColor: Color.red, percent: carbsPercentage)
                .frame(width: largestHeight - 40, height: largestHeight - 40)
            
            Ring(lineWidth: 12, backgroundColor: Color.background, foregroundColor: Color.yellow, percent: fatsPercentage)
                .frame(width: largestHeight - 80, height: largestHeight - 80)
            
            
            
        }
    }
}


