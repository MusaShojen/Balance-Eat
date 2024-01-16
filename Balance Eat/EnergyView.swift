//
//  EnergyView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 16.01.2024.
//

import SwiftUI

struct EnergyView: View {
    var body: some View {
        HStack(spacing:  61){
            VStack(alignment: .leading, spacing: 32){
                
                Text("Energy")
                    .frame(height: 18)
                    .font(Fonts.regular.size(20))
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                
                
                
                VStack(alignment: .leading){
                    
                    NutritionCellView(color: .blue, text: "Protein")
                    NutritionCellView(color: .red, text: "Fat")
                    NutritionCellView(color: .yellow, text: "Carb")
                }
                
            }
            MultipleRings(largestHeight: 113)
        }.padding(16)
            .background(.white)
            
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    EnergyView()
}
