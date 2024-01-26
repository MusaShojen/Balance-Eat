//
//  DisclosureGroupCustom.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 17.01.2024.
//

import SwiftUI

struct Meals: View {
  @Binding var consumed : Set<Product>
  //  let products : [[Product]]
    let products: ProductMock
    var body: some View {
        
        
        VStack(spacing: 8){
            DisclosureCell(consumed: $consumed, mealTime: "Breakfast", products: products.breakfast)
            Divider().padding(.horizontal, 16)
            DisclosureCell(consumed: $consumed, mealTime: "Lunch", products: products.lunch)
            Divider().padding(.horizontal, 16)
            DisclosureCell(consumed: $consumed, mealTime: "Dinner", products: products.dinner)
           
        }
    }
}


