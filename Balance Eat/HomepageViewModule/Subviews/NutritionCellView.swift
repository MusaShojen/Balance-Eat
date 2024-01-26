//
//  NutritionCellView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 16.01.2024.
//

import SwiftUI

struct NutritionCellView: View {
    let color : Color
    let text: String
    let percent: Double
    
    var body: some View {
        HStack (spacing: 5){
            Circle()
                .frame(width: 16, height: 16)
                .foregroundStyle(color)
                
            Text(text)
                .font(Fonts.regular.size(16))
                .frame(height: 16)
                .foregroundStyle(.black)
              Spacer()
            
            // ЗАголовок Н5
            Text("\(Int(percent.rounded())) %")
                .frame(height: 16)
                .font(Fonts.regular.size(16))
                .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
            
        }
    }
}

#Preview {
    NutritionCellView(color: .blue, text: "Carb", percent: 25)
}
