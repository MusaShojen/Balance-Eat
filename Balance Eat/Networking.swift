//
//  Networking.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 8.01.2024.
//

import Foundation

 
enum APIError: Error {
    case requestFailed
    case invalidResponse
    case decodingError
}

struct AccessTokenResponse: Decodable {
    let access_token: String
    let expires_in: Int
    let token_type: String
    let scope: String
}
class Networking{
    
    var secretKey = "f965cb2a98c14c6ab07ae50d7b2a582c"
    var clientId = "fbee3fecead5438ab0b6c5361ef5e941"
    
    
  func requestAccessToken() async throws -> AccessTokenResponse {
        let url = URL(string: "https://oauth.fatsecret.com/connect/token")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let credentials = "\(clientId):\(secretKey)"
        let base64Credentials = Data(credentials.utf8).base64EncodedString()
        request.setValue("Basic \(base64Credentials)", forHTTPHeaderField: "Authorization")
        
        let body = "grant_type=client_credentials&scope=basic premier"
         request.httpBody = body.data(using: .utf8)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            let accessTokenResponse = try decoder.decode(AccessTokenResponse.self, from: data)
            
            return accessTokenResponse
        } catch {
            print("Token")
            throw APIError.requestFailed
        }
    }
    
    
    func searchCategories( accessToken: String) async throws -> FoodCategoriesResponse {
        let url = URL(string: "https://platform.fatsecret.com/rest/server.api")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let parameters = [
            URLQueryItem(name: "method", value: "food_categories.get.v2"),
            URLQueryItem(name: "format", value: "json")
        ]

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = parameters

        
        do {
      
           
            request.httpBody = urlComponents?.query?.data(using: .utf8)
              let (data, _) = try await URLSession.shared.data(for: request)
              print(String(data: data, encoding: .utf8) ?? "Invalid UTF-8 data")
              let decoder = JSONDecoder()
              let foodSearchResult = try decoder.decode(FoodCategoriesResponse.self, from: data)
              
              return foodSearchResult
          } catch {
              throw APIError.requestFailed
          }
    }
    
    
    func searchFoods(searchExpression: String, accessToken: String) async throws -> Foods {
        let url = URL(string: "https://platform.fatsecret.com/rest/server.api")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let parameters = [
            URLQueryItem(name: "method", value: "foods.search"),
            URLQueryItem(name: "search_expression", value: searchExpression),
            URLQueryItem(name: "format", value: "json")
        ]

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = parameters

        
        do {
      
           
            request.httpBody = urlComponents?.query?.data(using: .utf8)
              let (data, _) = try await URLSession.shared.data(for: request)
              print(String(data: data, encoding: .utf8) ?? "Invalid UTF-8 data")
              let decoder = JSONDecoder()
              let foodSearchResult = try decoder.decode(Foods.self, from: data)
              
              return foodSearchResult
          } catch {
              throw error
          }
    }
    
    
}

//// Пример использования
//do {
//    let clientId = "<YOUR_CLIENT_ID>"
//    let clientSecret = "<YOUR_CLIENT_SECRET>"
//    
//    let accessTokenResponse = try await requestAccessToken(clientId: clientId, clientSecret: clientSecret)
//    
//    print("Access Token: \(accessTokenResponse.access_token)")
//} catch {
//    print("Error: \(error)")
//}
