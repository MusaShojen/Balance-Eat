//
//  SummaryView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 10.01.2024.
//

import SwiftUI

struct SummaryView: View {
    
    @State var progress: CGFloat = 0.5
    var body: some View {
        
  
        VStack(spacing: 34){
             
            HStack {
                
                VStack(alignment: .leading ,spacing: 32){
                    
                    VStack (alignment: .leading ,spacing: 5){
                        
                        Text("Актуальный вес")
                            .font(Font.custom("Lato-Regular", size: 24))
                            .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                            .frame(height: 20)
                        
                        
                        Text("74,4 кг")
                            .font(
                                Font.custom("Lato-Black", size: 32)
                                    .weight(.black)
                            )
                            .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                            .frame(height: 32)
                    }
                    
                    
                    HStack(spacing: 35) {
                        VStack(alignment: .leading, spacing: 5){
                            
                            Text("Старт")
                                .font(Font.custom("Lato-Regular", size: 20))
                                .foregroundColor(.black)
                                .frame(height: 18)
                            
                            
                            Text("75 кг")
                                .font(Font.custom("Lato", size: 20))
                                .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                                .frame(height: 18)
                            
                        }
                        VStack(alignment: .leading, spacing: 5){
                            // Заголовок Н4
                            Text("Цель")
                                .font(Font.custom("Lato-Regular", size: 20))
                                .foregroundColor(.black)
                                .frame(height: 18)
                            
                            // Заголовок Н4
                            Text("70 кг")
                                .font(Font.custom("Lato", size: 20))
                                .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                                .frame(height: 18)
                            
                        }
                        
                    }
                    
                }
                
                Spacer()
                
                
                ActivityRing(progress: 0.5, lineWidth: 30)
                    .frame(width: 130, height: 130)
                
                
                
                
            }
            
            
            HStack(spacing: 8){
                
                
                
                ForEach(0..<7) { _ in
                    
                    VStack(spacing: 1){
                        
                        
                        Text("70кг")
                          .font(Font.custom("Lato-Regular", size: 10))
                          .multilineTextAlignment(.trailing)
                          .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                          .frame(height: 12)
                          .padding(.bottom, 1)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 40, height: 60)
                            .background(Color(red: 0.98, green: 0.97, blue: 0.97))
                            .cornerRadius(10)
                            
                        
                        // ЗАголовок Н5
                        Text("пн")
                          .font(Font.custom("Lato", size: 16))
                          .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                          .frame(height: 16)
                        
                    }
                  
                    
                }
             
                
              
                
            }
            
          
            
        
            
            
            
            
            
            }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 14)

            .background(.white)
            
            .clipShape(RoundedRectangle(cornerRadius: 10))
        //    .padding(.horizontal, 16)
          
           
                
                
                
              
            
        }
        
    }
    

#Preview {
    SummaryView()
}
