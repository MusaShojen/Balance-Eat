//
//  ContentView.swift
//  Balance Eat
//

//  Created by Муса Шогенов on 7.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPopoverVisible = false
    @State private var isSheetVisible = false
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @State var selected = "1"
    var body: some View {
       
        ZStack(alignment: .bottom){
            
            TabView(selection: $selected,
                    content:  {
                HomePageView().tabItem { Text("fdfd") }.tag("1")
                
                
                Text("Tab Content 2")
                
                    .tabItem { Text("Tab Label 2") }.tag("2")
                
                Text("Tab Content 3").tabItem { Text("Tab Label 3") }.tag("3")
                
                Text("Tab Content 4")
                
                    .tabItem { Text("Tab Label 4") }.tag("4")
                
                
                
                
            })
            
            Spacer()
            HStack(spacing: 47){
                
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
            
                
            }
            .sheet(isPresented: $isSheetVisible,  content: {
                WeightPickerView(isSheetVisible: $isSheetVisible)
            })
            .padding(.top, 20)
        //    .padding(.vertical, 20)
            .padding(.horizontal, 30)
    
            .frame(maxWidth: .infinity)
            .background(Color.white)
             
            
           
            
            
            
            
        }
    }
}


#Preview {
    ContentView()
}
