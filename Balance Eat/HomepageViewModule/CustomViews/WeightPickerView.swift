//
//  WeightPickerView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 20.01.2024.
//

import SwiftUI
import AudioToolbox


struct WeightPickerView: View {
    @State var offset: CGFloat = 200
    @ObservedObject var planProfile : PlanProfile
    @Binding var isSheetVisible : Bool
    @State var currentWeight: Double = 0.0
     var weight: String {
        
        
         let startWeight = planProfile.shownCurrentWeight - 1
        
       
        
        let progress = offset / 20
        let result = startWeight + (Double(progress) * 0.1)
        let roundedResult = (result * 10).rounded() / 10
       
        return String(roundedResult)
        
    }
    
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

                Text("Your current weight")
                  .font(
                    Fonts.black.size(32)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .padding(.horizontal, 73)
                  .padding(.bottom, 10)
                  .padding(.top, 65)
            
                Text("Set your today's weight to record your progress")
                  .font(Fonts.regular.size(16))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                  .frame(width: 247, alignment: .top)
                  .padding(.horizontal, 73)
                  .padding(.bottom, 55)
                
                HStack(spacing: 0) {
                    Text(weight)
                        .onChange(of: weight, { oldValue, newValue in
                           
            planProfile.currentWeight = Double(newValue)!
                            
                            currentWeight = Double(newValue)!
                            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                            AudioServicesPlayAlertSound(1157)

                        })
                      .font(
                        Fonts.black.size(64)
                      )
                      .foregroundColor(.white)
                    
                    Text("kg")
                      .font(Fonts.regular.size( 16))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white)
                      .offset(y:18)
 
                } 

                .padding(.horizontal, 15)
                
                CustomSlider(pickerCount: 3, offset: $offset){
                    PickerLines()
                }
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
}

#Preview {
    WeightPickerView(planProfile: (PlanProfile(start: 75, goal: 70, current: 74.4)), isSheetVisible: .constant(false))
}

struct PickerLines: View {
    var body: some View {
        
            let pickerCount = 4
            HStack(spacing: 0) {
                
                ForEach(1...pickerCount, id: \.self) {
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
}
