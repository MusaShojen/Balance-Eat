//
//  BodyTest.swift
//  Balance Eat
//
//  Created by 123 on 08.01.24.
//

import SwiftUI

struct BodyTest: View {
    var body: some View {
        ZStack {
            Color(.gray)
            VStack {
                HStack (alignment: .top) {
                    VStack(alignment: .leading, spacing: 32)  {
                        VStack (alignment: .leading, spacing: 5) {
                            Text("Актуальный вес")
                                .font(
                            Font.custom("Lato-Regular", size: 24))
                            Text("74,4 кг")
                              .font(
                                Font.custom("Lato-Black", size: 32)
                                  .weight(.black)
                              )
                              .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                            
                        }
    //                        .padding(.bottom, 20)
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Старт")
                                Text("75 кг")
                            }
                            .padding(.trailing, 35)
                            
                            VStack (alignment: .leading) {
                                Text("Цель")
                                Text("70 кг")
                                    .allowsTightening(true)
                                    .lineLimit(nil)
                            }
                        }
                    } .padding(.bottom, 34)
                    
                    Circle()
                        .frame(alignment: .trailing)
                        .frame(width: 130)
                        
                }                
                VStack {
                    Weight()
                }
                
            }
            
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 16)
            
        }
    }
}

#Preview {
    BodyTest()
}
