//
//  WeightPickerView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 20.01.2024.
//

import SwiftUI

struct WeightPickerView: View {
    @State var offset: CGFloat = 0
    @Binding var isSheetVisible : Bool
    var body: some View {
        
      
         
          
        ZStack(alignment: .top){
            Color.blue.ignoresSafeArea()
            
            HStack {
                
                Button {
                    isSheetVisible.toggle()
                } label: {
                    Text("Cancel")
                        .font( Fonts.regular.size(16))
                        .foregroundColor(.white)
                        .padding(.leading)
                        .padding(.top)
                }

               
                Spacer()
            }
            
            
            
            VStack(spacing: 0){
                
                // Заголовок H1
                Text("Your current weight")
                  .font(
                    Fonts.black.size(32)
                     
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                //  .frame(height: 64)
                  .padding(.horizontal, 73)
                  .padding(.bottom, 10)
                  .padding(.top, 65)
                
                // ЗАголовок Н5
                Text("Set your today's weight to record your progress")
                  .font(Fonts.regular.size(16))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 247, alignment: .top)
                  .padding(.horizontal, 73)
                  .padding(.bottom, 55)
                
                HStack(spacing: 0) {
                    Text(getWeeight())
                      .font(
                        Fonts.black.size(64)
                          
                      )
                      .foregroundColor(.white)
                     
                    // ЗАголовок Н5
                    Text("kg")
                      .font(Fonts.regular.size( 16))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white)
                      .offset(y:18)
                    
               
                } 
                .onAppear{
                    
                    if offset == 0 {
                        offset = 200
                    }
                }
                .padding(.horizontal, 15)
                
                CustomSlider(pickerCount: 3, offset: $offset) {
                    let pickerCOunt = 4
                    HStack(spacing: 0) {
                        
                        ForEach(1...pickerCOunt, id: \.self) {
                            index in
                            Rectangle()
                                .fill(.white)
                                .frame(width: 1, height: 96)
                                .frame(width: 20)
                            
                            
                            ForEach(1...4, id: \.self) {
                                index in
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 1, height: 57)
                                    .frame(width: 20)
                                    .padding(.top, 20)
                            }
                            
                            
                        }
                        
                        Rectangle()
                            .fill(.white)
                            .frame(width: 1, height: 96)
                            .frame(width: 20)
                        
                    }
                    
                    
                    
                }
              //  .content.offset(CGSize(width: 100, height: 0))
                .overlay {
                    
                
                    
                        
                    
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: 2, height: 180)
                        .frame(width: 20)
                   
                    
                }
                .frame(height: 100)
                .padding()
                .padding(.top, 25)
                .padding(.bottom, 55)
                
                Button {
                    
                    isSheetVisible.toggle()
                    
                } label: {
                    Text("Set weight")
                        .font(Fonts.regular.size( 16))
                      .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                      .background(RoundedRectangle(cornerRadius: 15).fill(.white).frame(width: 225, height: 48))
                }

        
                
            }
            
        }
    }
    
    func getWeeight()-> String {
        
        let startWeight = 74.0
        
       
        
        let progress = offset / 20
        print (offset)
        let result = startWeight + (Double(progress) * 0.1)
        let roundedResult = (result * 10).rounded() / 10
        
        return String(format: "%.1f", roundedResult)
    }
}

#Preview {
    WeightPickerView(isSheetVisible: .constant(false))
}
