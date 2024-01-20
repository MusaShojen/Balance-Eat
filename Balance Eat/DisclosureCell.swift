//
//  TodayPlanView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 17.01.2024.
//

import SwiftUI


struct DisclosureCell: View {
    
    @State private var selectedProducts: Set<String> = []
    @State var exp: Bool = false
    @State var isAllSelected: Bool = false
    
    var allProducts: Set<String> {
        
        return Set(products)
    }
    
    let products = ["Каша","Суп","Морковь"]
    var body: some View {
        
        DisclosureGroup(isExpanded: $exp) {
            VStack(alignment: .leading){
                ForEach(products, id: \.self) {
                    product in
                    
                    HStack {
                        Text(product)
                            .font(Fonts.regular.size(13))
                            .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                        Spacer()
                        Image(systemName:selectedProducts.contains(product) ? "circle.fill" : "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                            .foregroundColor((Color(red: 0.12, green: 0.85, blue: 0.89)))
                            .padding(.trailing, 16)
                            .onTapGesture {
                                if selectedProducts.contains(product) {
                                    selectedProducts.remove(product)
                                } else {
                                    selectedProducts.insert(product)
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
                //    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 17).tint(.black)
                    .rotationEffect(Angle(degrees: exp ? -180 : 0))
                Text("Breakfast")
                    .font(Fonts.regular.size(16))
                    .frame(height: 16)
                    .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                //.tint(.black)
                Spacer()
                Button {
                    
                    isAllSelected.toggle()
                    if isAllSelected {
                        selectedProducts = allProducts
                    } else {
                        selectedProducts.removeAll()
                    }
                    
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
        isAllSelected = selectedProducts == allProducts
    }
    
  
    
}



#Preview{
    
    DisclosureCell()
    
}
