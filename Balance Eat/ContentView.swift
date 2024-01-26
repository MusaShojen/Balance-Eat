//
//  ContentView.swift
//  Balance Eat
//

//  Created by Муса Шогенов on 7.01.2024.
//

import SwiftUI

//MARK: TabBar
struct ContentView: View {
    
    @StateObject var planProfile = PlanProfile(start: 75, goal: 70, current: 74.4)
    @State private var isPopoverVisible = false
    @State private var isSheetVisible = false
    
    // When "selected" change value, view changes to another
    @State var selected = "1"
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {

        ZStack(alignment: .bottom){
            
            TabView(selection: $selected,
                    content:  {
                HomePageView(viewModel: HomePageViewModel(planProfile: planProfile)).tabItem { Text("fdfd") }.tag("1")
                
                Text("Tab Content 2")
                
                    .tabItem { Text("Tab Label 2") }.tag("2")
                
                Text("Tab Content 3").tabItem { Text("Tab Label 3") }.tag("3")
                
                Text("Tab Content 4")
                
                    .tabItem { Text("Tab Label 4") }.tag("4")
              
            })
            
            Spacer()
            
            CustomTabBar(planProfile: planProfile, isPopoverVisible: $isPopoverVisible, selected: $selected, isSheetVisible: $isSheetVisible)
        }
    }
}


#Preview {
    ContentView()
}

struct CustomTabBar: View {
    @ObservedObject var planProfile : PlanProfile
    @Binding var isPopoverVisible : Bool
    @Binding var selected: String
    @Binding var isSheetVisible: Bool
    var body: some View {
        HStack(spacing: 0){
            Spacer()
            
            Button {
                selected = "1"
                isPopoverVisible = false
                
            } label: {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(selected == "1" ? .blue : .gray)
                    .frame(width: 28, height: 28, alignment: .center)
                
            }
            
            Spacer()
            
            Button {
                selected = "2"
                isPopoverVisible = false
                
            } label: {
                Image(systemName: "fork.knife")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(selected == "2" ? .blue : .gray)
                    .frame(width: 28, height: 28, alignment: .center)
            }
            Spacer()
            
            Button {
                
                isPopoverVisible.toggle()
                
                
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.blue)
                    .frame(width: 39, height: 39, alignment: .center)
            }
            
            .overlay(
                Group {
                    if isPopoverVisible {
                        
                        ZStack {
                            CircleButton(action: {
                                print("First Circle Tapped")
                                isSheetVisible = true
                                isPopoverVisible.toggle()
                            })
                            .offset(x: -40, y: -30)
                            
                            CircleButton(action: {
                                print("Second Circle Tapped")
                                isPopoverVisible.toggle()
                            })
                            .offset(x: 40, y: -30)
                        }
                        .transition(.scale)
                    }
                }
            )
            
            Spacer()
            
            Button {
                
                selected = "3"
                isPopoverVisible = false
                
            } label: {
                Image(systemName: "chart.bar.xaxis")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(selected == "3" ? .blue : .gray)
                    .frame(width: 28, height: 28, alignment: .center)
            }
        
            Spacer()
            
            Button {
                selected = "4"
                isPopoverVisible = false
                
            } label: {
                Image(systemName: "person.2.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(selected == "4" ? .blue : .gray)
                    .frame(width: 28, height: 28, alignment: .center)
            }
            
            Spacer()
            
        }
        .sheet(isPresented: $isSheetVisible,  content: {
            WeightPickerView(planProfile: planProfile, isSheetVisible: $isSheetVisible)
        })
        .frame(maxWidth: .infinity)
        .frame(height: 87)
        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
        
        
        .offset(y: 32)
    }
}
