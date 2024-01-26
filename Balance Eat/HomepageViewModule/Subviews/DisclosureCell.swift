//
//  TodayPlanView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 17.01.2024.
//

import SwiftUI

struct Product: Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    var energy: Int {
        let result = (protein * 4) + (carbs * 4) + (fats * 9)
        return result
    }
    let protein: Int
    let carbs: Int
    let fats: Int
}


struct DisclosureCell: View {
    @State var exp: Bool = false
    @State var isAllSelected: Bool = false
    @Binding var consumed : Set<Product>
    @EnvironmentObject var viewModel : HomePageViewModel
    var mealTime: String
    var allProducts: Set<Product> {
        
        return Set(products)
    }
    
    let products : [Product]
    var body: some View {
        
        DisclosureGroup(isExpanded: $exp) {
            VStack(alignment: .leading){
                ForEach(products) {
                    product in
                    
                    HStack {
                        Text(product.name)
                            .font(Fonts.regular.size(13))
                            .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                        Spacer()
                        Image(systemName:consumed.contains(product) ? "circle.fill" : "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                            .foregroundColor((Color(red: 0.12, green: 0.85, blue: 0.89)))
                            .padding(.trailing, 16)
                            .onTapGesture {
                                
                                
                                if consumed.contains(product) {
                                    consumed.remove(product)
                                    
                                } else {
                                    consumed.insert(product)
                                }
                                updateIsAllSelected()
                                
                            }
                        
                    }
                    
                    
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 15)
            .padding(.leading, 33)
        } label: {
            HStack(spacing: 6){
                Image(systemName:"chevron.down")

                    .frame(width: 10, height: 17).tint(.black)
                    .rotationEffect(Angle(degrees: exp ? -180 : 0))
                Text(mealTime)
                    .font(Fonts.regular.size(16))
                    .frame(height: 16)
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                //.tint(.black)
                Spacer()
                Button {
                    
                    isAllSelected.toggle()
                    if isAllSelected {
                        allProducts.forEach { consumed.insert($0) }
                    } else {
                        allProducts.forEach { consumed.remove($0) }
                    }
                    
                    updateIsAllSelected()
                    
                } label: {
                    ZStack{
                        if isAllSelected {
                            Image(systemName: "checkmark")
                                .resizable()
                                .scaledToFit()
                                .tint(.green)
                                .frame(width: 17, height: 17)
                                .offset(CGSize(width: 5.0, height: 0.0))
                            
                        }
                        Image(systemName: "square")
                            .resizable()
                            .scaledToFit()
                            .tint(.green)
                            .frame(width: 17, height: 17)
                            .offset(CGSize(width: 5.0, height: 0.0))
                    }
                }
                
                
                
                
            }.padding(.leading, 16)
        }
        .tint(.clear)
        
        
        
    }
    
    
    func updateIsAllSelected() {
        isAllSelected = consumed.isSuperset(of: allProducts)
        
        viewModel.calculatePercentage()
       
        print(consumed.count)
        
    }
    
    
    
}



//#Preview{
//    
//    DisclosureCell(products: ProductMock.shared.products)
//    
//}



