//
//  ContentView.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 7.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Balance Eat")
            
            TextField("Запрос", text: $text)
        }
        .padding()
        .onAppear{
            
         let networking = Networking()
            Task {
                
                do {
                    let accessToken = try await networking.requestAccessToken()
                    print(accessToken.access_token)
        
                    print(try await networking.searchCategories(accessToken: accessToken.access_token))
                    
                    let response = try await networking.searchFoods(searchExpression: "watermelon", accessToken: accessToken.access_token)
                    
              print(response.foods.first?.foods.food.foodName)
                    
                } catch {
                    
                    print(error)
                }
                
              
            }
            
        }

        }
    }


#Preview {
    ContentView()
}
