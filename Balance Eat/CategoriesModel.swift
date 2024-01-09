//
//  CategoriesModel.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 9.01.2024.
//

import Foundation



struct FoodCategoriesResponse: Codable {
    let foodCategories: FoodCategories
    
    enum CodingKeys: String, CodingKey {
        case foodCategories = "food_categories"
    }
}

struct FoodCategories: Codable {
    let foodCategory: [FoodCategory]
    
    enum CodingKeys: String, CodingKey {
        case foodCategory = "food_category"
    }
}

struct FoodCategory: Codable {
    let foodCategoryDescription: String
    let foodCategoryId: String
    let foodCategoryName: String
    
    enum CodingKeys: String, CodingKey {
        case foodCategoryDescription = "food_category_description"
        case foodCategoryId = "food_category_id"
        case foodCategoryName = "food_category_name"
    }
}
