//
//  TodayPlanView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 18.01.2024.
//

import SwiftUI

struct TodayPlanView: View {
    var body: some View {
      
        VStack(alignment: .leading, spacing: 31){
            Text("Today’s plan")
                .font(Fonts.regular.size(20))
                .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                .frame(height: 18, alignment: .topLeading)
                .padding(.leading, 16)
                .padding(.top, 16)
            Meals()
        }
        
        .background(.white)
        
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    TodayPlanView()
}
