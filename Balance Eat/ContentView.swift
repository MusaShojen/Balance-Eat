//
//  ContentView.swift
//  Balance Eat
//

//  Created by Муса Шогенов on 7.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @State var selected = "1"
    var body: some View {
        //  Spacer()
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
                    
                } label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(selected == "1" ? .blue : .gray)
                        .frame(width: 28, height: 28, alignment: .center)
                }
                
                Button {
                    selected = "2"
                    
                } label: {
                    Image(systemName: "fork.knife")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(selected == "2" ? .blue : .gray)
                        .frame(width: 28, height: 28, alignment: .center)
                }
                
                Button {
                    
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .frame(width: 28, height: 28, alignment: .center)
                }
                
                Button {
                    
                    selected = "3"
                    
                } label: {
                    Image(systemName: "chart.bar.xaxis")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(selected == "3" ? .blue : .gray)
                        .frame(width: 28, height: 28, alignment: .center)
                }
                
                Button {
                    selected = "4"
                    
                } label: {
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(selected == "4" ? .blue : .gray)
                        .frame(width: 28, height: 28, alignment: .center)
                }
                
            }
            
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity)
            .background(.white)
            //  .clipShape(RoundedRectangle(cornerRadius: 10))
            
            .edgesIgnoringSafeArea(.bottom)
            
            
            
            
        }
    }
}


#Preview {
    ContentView()
}
