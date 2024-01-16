//
//  HomePageView.swift
//  Balance Eat
//
//  Created by 123 on 08.01.24.
//

import SwiftUI

struct HomePageView: View {
    
    var body: some View {
        ZStack {
            Color(red: 237/255, green: 237/255, blue: 237/255).edgesIgnoringSafeArea(.all)
            NavigationStack {
                VStack {
                    SummaryView(progress: 0.7)
                        .padding(.horizontal, 16)
                        .toolbarBackground(.visible, for: .navigationBar)
                    
                    
                    EnergyView().padding(.horizontal, 16)
//                        .navigationBarTitleDisplayMode(.inline)
                        
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                HStack {
                                    VStack(alignment: .leading)
                                    {
                                        // Заголовок Н6
                                        Text("Sunday, 31 dec.")
                                            .font(Font.custom("Lato", size: 13))
                                            .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                                        
                                        Text("Summary")
                                            .font(Fonts.regular.size(28)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(Color(red: 0.09,green: 0.09, blue: 0.09))
                                    }
                                    .padding(.leading, 12)
                                }
                                .frame(maxWidth: .infinity)
                                .background(.white)
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Image(systemName: "person.crop.circle")
                                    .frame(width: 36, height: 36)
                                    .background(Color(red: 0.98, green: 0.97, blue: 0.97))
                            }
                        }
                    
                        

                }
            } /*.navigationTitle("Сводка").ignoresSafeArea()*/
            
        }
    }
}

#Preview {
    
    NavigationStack {
        HomePageView()
    }
    
}
