//
//  HomePageView.swift
//  Balance Eat
//
//  Created by 123 on 08.01.24.
//

import SwiftUI

struct ScrollPreKey : PreferenceKey {
 
    
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct HomePageView: View {
    
    
    @State var isScrolling = false
    
    
    
    var body: some View {
     
            ZStack (alignment: .top ){
                Color(red: 237/255, green: 237/255, blue: 237/255).edgesIgnoringSafeArea(.all)
             
            
                
                ScrollView{
                    
                        
                        GeometryReader { proxy in
                            
                            
                            Color.clear
                                .preference(key: ScrollPreKey.self, value: proxy.frame(in: .named("scroll")).minY)
                    }
                    
                    
                    
                    VStack {
                        SummaryView(progress: 0.7)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                            .toolbarBackground(.visible, for: .navigationBar)
                        
                        
                        EnergyView().padding(.horizontal, 16)
                        
                        TodayPlanView().padding(.horizontal, 16)
                        
                        
                      
                        
                        
                        
                    }
                    
                }
                
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(ScrollPreKey.self, perform: { value in
                    
                    withAnimation(.default) {
                        
                        if value < -10 {
                            isScrolling = true
                            print(isScrolling)
                            
                        } else {
                            isScrolling = false
                            print(isScrolling)

                        }
                        
                    }
                   
                })
                .safeAreaInset(edge: .top, content: {
                    Color.clear
                        .frame(height: 22)
                })
                .overlay {
                    
                    
                    ZStack {
                        
                        Color.white
                            .frame(height: 107)
                            .opacity(isScrolling ? 0 : 1)
                            .background(.ultraThinMaterial)
                            .blur(radius: 0.5)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .ignoresSafeArea(edges: .top)
                            
                          
                        
                        HStack{
                            
                            VStack(alignment: .leading)
                            {
                                // Заголовок Н6
                                Text("Sunday, 31 dec.")
                                
                                    .font(Fonts.regular.size(isScrolling ? 10 : 13))
                                    .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                                
                                Text("Summary")
                                
                                    .font(Fonts.regular.size(isScrolling ? 25 : 28)
                                        .weight(.semibold)
                                    )
                                    .foregroundColor(Color(red: 0.09,green: 0.09, blue: 0.09))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: isScrolling ? 30 : 36, height: isScrolling ? 30 : 36)
                                .background(.clear)
                        }
                        .offset(y: -40)
                        .padding(.horizontal, 16)
                        
                        
                    }
                    
                   //
                    .frame(maxHeight: .infinity, alignment: .top )
                    .offset(y: isScrolling ? -10 : 0)
                    

                    
                    
                    
                    
                }
                
                
               
                .safeAreaPadding(.bottom,66)
            }
           
        
    }
}






#Preview {
    
    NavigationStack {
        HomePageView()
    }
    
}
