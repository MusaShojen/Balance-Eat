//
//  DisclosureGroupCustom.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 17.01.2024.
//

import SwiftUI

struct Meals: View {
   
    var body: some View {
        
        
        VStack(spacing: 8){
            DisclosureCell()
            Divider().padding(.horizontal, 16)
            DisclosureCell()
            Divider().padding(.horizontal, 16)
            DisclosureCell()
           
        }
    }
}

#Preview {
    
    
    Meals()
}
