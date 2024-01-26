//
//  SummaryView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 10.01.2024.
//

import SwiftUI

struct CurrentWeightView: View {
    
    var progress: Double {
        return ((planProfile.shownCurrentWeight - planProfile.startWeight) / (planProfile.goalWeight - planProfile.startWeight)) * 100
    }
    @ObservedObject var planProfile: PlanProfile
    
    //weekDays precent needs to depend on previous results of consumed energy
    let weekDays: [(String, Double)] = [
        ("mon", 60.0),
        ("tue", 90.0),
        ("wed", 0.0),
        ("thu", 0.0),
        ("fri", 0.0),
        ("sat", 0.0),
        ("sun", 0.0)
    ]
    
    
    var body: some View {
        
        
        VStack(spacing: 34){
            
            HStack {
                
                VStack(alignment: .leading ,spacing: 32){
                    
                    VStack (alignment: .leading ,spacing: 5){
                        
                        Text("Current weight")
                            .font(Fonts.regular.size(24))
                            .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                            .frame(height: 20)
                        
                        Text("\(String(format: "%.1f", planProfile.currentWeight != 0 ? planProfile.currentWeight : planProfile.shownCurrentWeight)) kg")
                            .font(
                                Fonts.black.size(32)
                            )
                            .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                            .frame(height: 32)
                    }
                    HStack(spacing: 35) {
                        VStack(alignment: .leading, spacing: 5){
                            
                            Text("Start")
                                .font(Fonts.regular.size(20))
                                .foregroundColor(.black)
                                .frame(height: 18)
                            
                            
                            Text("\(String(format: "%.1f", planProfile.startWeight)) kg")
                                .font(Fonts.regular.size(20))
                                .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                                .frame(height: 18)
                            
                        }
                        VStack(alignment: .leading, spacing: 5){
                            
                            Text("Goal")
                                .font(Fonts.regular.size(20))
                                .foregroundColor(.black)
                                .frame(height: 18)
                            
                            Text("\(String(format: "%.1f", planProfile.goalWeight)) kg")
                                .font(Fonts.regular.size(20))
                                .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                                .frame(height: 18)
                            
                        }
                        
                    }
                    
                }
                
                Spacer()
                
                Ring(lineWidth: 30, backgroundColor: Color.background, foregroundColor: Color.blue, percent: progress)
                    .frame(width: 130, height: 130)
            }
            
            
            HStack(spacing: 8){
                
                ForEach(weekDays, id: \.0) { day, completionPercent in
                    
                    WeekDay(completionPercent: completionPercent, day: day)
                    
                }
                
            }
            
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 14)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        
    }
    
}



//MARK: WeekDayView


struct WeekDay: View {
    var completionPercent : Double
    let day: String
    
    var body: some View {
        VStack(spacing: 1){
            
            
            Text("70kg")
                .font(Fonts.regular.size(10))
                .multilineTextAlignment(.trailing)
                .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                .frame(height: 12)
                .padding(.bottom, 1)
            ZStack {
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 40, height: 60)
                    .background(Color.background)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 40, height: 60)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .scaleEffect(x: 1, y: CGFloat(completionPercent/100), anchor: .bottom)
                
            }
            
            Text(day)
                .font(Fonts.regular.size(16))
                .foregroundColor(Color(red: 0.34, green: 0.34, blue: 0.34))
                .frame(height: 16)
            
        }
    }
}
