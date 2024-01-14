//
//  CircleView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 14.01.2024.
//

import SwiftUI





struct ActivityRing: View {
    var progress: Double
    var lineWidth: CGFloat
   

    var body: some View {
        
        ZStack{
            
            Circle()
               
                .rotation(.degrees(-90))
                .stroke(
                    Color.background,
                    style: .init(lineWidth: lineWidth, lineCap: .round)
                )
                .scaledToFit()
                .padding(lineWidth/2)
            
            
            Circle()
                .trim(from: 0, to: CGFloat(progress))
                .rotation(.degrees(-90))
                .stroke(
                    Color.blue,
                    style: .init(lineWidth: lineWidth, lineCap: .round)
                )
                .scaledToFit()
                .padding(lineWidth/2)
        }
    }
}

#Preview {
    
    ActivityRing(progress: 0.5, lineWidth: 30)
    
}

