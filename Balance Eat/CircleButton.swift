//
//  CircleButton.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 19.01.2024.
//

import SwiftUI

struct CircleButton: View {
    
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    CircleButton{
        
    }
}
