//
//  Testing.swift
//  Balance Eat
//
//  Created by 123 on 08.01.24.
//

import SwiftUI

struct Testing: View {
    var body: some View {
        ScrollView {
            ForEach(0..<40) { int in
                Text("AAA")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
        }
        .background(Color (red: 237/255, green: 237/255, blue: 237/255))
        .overlay {
            ZStack {
                Color.white
                    .frame(height: 100)
                    .background(.ultraThinMaterial)
                    .opacity(1)
                    .blur(radius: 0.5)
                    .edgesIgnoringSafeArea(.top)
                HStack {
                    Text ("HomeView").bold()
                        .font(.system(size: 32))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                    Image (systemName: "person.circle.fill")
                        .font(.largeTitle)
                }                .offset(y: -25)
                .padding(.horizontal)
            }
            .frame(maxHeight: .infinity, alignment: .top)

        }
    }
}

#Preview {
    Testing()
    
}

