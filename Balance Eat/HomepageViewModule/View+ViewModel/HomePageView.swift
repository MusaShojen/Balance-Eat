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
    
  //  @State var isScrolling = false
 //   @State var wholePercent: Double = 0
    @ObservedObject var viewModel : HomePageViewModel
 
    
    var body: some View {
        
        ZStack (alignment: .top ){
            Color(red: 237/255, green: 237/255, blue: 237/255).edgesIgnoringSafeArea(.all)
            
            ScrollView{
                
                
                GeometryReader { proxy in
                    
                    
                    Color.clear
                        .preference(key: ScrollPreKey.self, value: proxy.frame(in: .named("scroll")).minY)
                }
                VStack {
                    CurrentWeightView(planProfile: viewModel.planProfile)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                    
                    EnergyView(proteinPercentage: $viewModel.proteinPercentage, carbsPercentage: $viewModel.carbsPercentage, fatsPercentage: $viewModel.fatsPercentage)
                        .padding(.horizontal, 16)
                        
                    
                    TodayPlanView(consumed: $viewModel.consumed, products: viewModel.meals)
                        .padding(.horizontal, 16)
                        .environment(viewModel)
                }
            }
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ScrollPreKey.self, perform: { value in
                
                withAnimation(.default) {
                    
                    if value < -10 {
                        viewModel.isScrolling = true
                    } else {
                        viewModel.isScrolling = false
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
                        .opacity( viewModel.isScrolling ? 0 : 1)
                        .background(.ultraThinMaterial)
                        .blur(radius: 0.5)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .ignoresSafeArea(edges: .top)
                    
                    CustomNavBar(isScrolling: $viewModel.isScrolling)
                }
                .frame(maxHeight: .infinity, alignment: .top )
                .offset(y:  viewModel.isScrolling ? -10 : 0)
            }
            .safeAreaPadding(.bottom,66)
        }
    }
}






#Preview {
    
    NavigationStack {
        HomePageView(viewModel: HomePageViewModel(planProfile: PlanProfile(start: 75, goal: 70, current: 74.4)))
    }
    
}

struct CustomNavBar: View {
    @Binding var isScrolling : Bool
    
    var body: some View {
        HStack{
            
            VStack(alignment: .leading)
            {
                Text("Sunday, 31 dec.")
                    .font(Fonts.regular.size(isScrolling ? 10 : 13))
                    .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                
                Text("Summary")
                    .font(Fonts.regular.size(isScrolling ? 25 : 28)
                    .weight(.semibold))
                    .foregroundColor(Color(red: 0.09,green: 0.09, blue: 0.09))
            }
            
            Spacer()
            
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: isScrolling ? 30 : 36, height: isScrolling ? 30 : 36)
                .foregroundStyle(.gray)
                .background(.clear)
        }
        .offset(y: -40)
        .padding(.horizontal, 16)
    }
}
