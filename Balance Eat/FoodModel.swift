//
//  FoodModel.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 9.01.2024.
//

import Foundation

struct Foods: Codable {
    
    let foods: [Food]
    
}

struct Food: Codable {
    struct FoodDetails: Codable {
        let brandName: String?
        let foodDescription: String
        let foodId: String
        let foodName: String
        let foodType: String
        let foodUrl: String?
        
        enum CodingKeys: String, CodingKey {
            case brandName = "brand_name"
            case foodDescription = "food_description"
            case foodId = "food_id"
            case foodName = "food_name"
            case foodType = "food_type"
            case foodUrl = "food_url"
        }
    }

    struct FoodsInfo: Codable {
        let food: FoodDetails
        let maxResults: String
        let pageNumber: String
        let totalResults: String
        
        enum CodingKeys: String, CodingKey {
            case food
            case maxResults = "max_results"
            case pageNumber = "page_number"
            case totalResults = "total_results"
        }
    }
    
    let foods: FoodsInfo
}
