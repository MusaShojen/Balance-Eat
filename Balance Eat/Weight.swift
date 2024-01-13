//
//  Weight.swift
//  Balance Eat
//
//  Created by 123 on 13.01.24.
//


import Foundation
import SwiftUI


struct WeightBlock: View {
    let weight: String
    let day: String
    
    var body: some View {
        VStack {
            Text("\(weight)кг")
                .font(Font.custom("Lato", size: 10))
                .multilineTextAlignment(.trailing)
                .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 40, height: 60)
                .background(Color(red: 0.98, green: 0.97, blue: 0.97))
                .cornerRadius(10)
            
            Text(day)
                .font(Font.custom("Lato", size: 12))
                .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
        }
    }
}

struct Weight: View {
    var body: some View {
        HStack {
            ForEach([
                ("55", "ПТ"),
                ("65", "ВТ"),
                ("89", "СР"),
                ("69", "ЧТ"),
                ("89", "ПТ"),
                ("59", "СБ"),
                ("99", "ВС"),
                // Добавьте остальные веса и дни недели по аналогии
            ], id: \.0) { weight, day in
                WeightBlock(weight: weight, day: day)
            }
        }
    }
}
