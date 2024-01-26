//
//  HomePageViewModel.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 26.01.2024.
//

import Foundation

class ProductMock {
    
    static let shared = ProductMock()
    private init() {
        
    }
    let breakfast = [Product(name: "Meat", protein: 12, carbs: 41, fats: 5), Product(name: "Soup", protein: 10, carbs: 32, fats: 11), Product(name: "Fruits", protein: 4, carbs: 21, fats: 8)]
    let lunch = [Product(name: "Meat", protein: 12, carbs: 4, fats: 5), Product(name: "Soup", protein: 12, carbs: 32, fats: 11), Product(name: "Fruits", protein: 4, carbs: 23, fats: 8)]
    let dinner = [Product(name: "Meat", protein: 12, carbs: 4, fats: 5), Product(name: "Soup", protein: 12, carbs: 32, fats: 11), Product(name: "Fruits", protein: 4, carbs: 23, fats: 8)]
    
    var totalProducts : [Product] {
        
        return breakfast + lunch + dinner
    }
    
    var totalEnergy : Int {
        
      var result = 0
        
        for product in totalProducts {
            result += product.energy
        }
        
        
        return result
        
    }
    var totalProtein : Int {
        var result = 0
          
          for product in totalProducts {
              result += product.protein
          }
          
          return result
        
    }
    
    var totalCarbs : Int {
        var result = 0
          
          for product in totalProducts {
              result += product.carbs
          }
          
          return result
        
    }
    
    var totalFats : Int {
        var result = 0
          
          for product in totalProducts {
              result += product.fats
          }
          
          return result
        
    }
}



class NutritionElements {
    
    var energy: Int {
        let result = (protein * 4) + (carbs * 4) + (fats * 9)
        return result
    }
    var protein: Int = 0
    var carbs: Int = 0
    var fats: Int = 0
    
    var proteinPercent: Double = 0.0
    var carbsPercent: Double = 0.0
    var fatsPercent: Double = 0.0
   
}

//MARK: ViewModel

@MainActor final class HomePageViewModel: ObservableObject, Observable {
    
    @Published var isScrolling = false
    @Published var planProfile : PlanProfile
    @Published var consumed : Set<Product> = []
//    @Published var consumed : [String:Int] = ["protein" : 0, "carbs" : 0, "fats": 0]
    @Published var proteinPercentage: Double = 0.0
    @Published var carbsPercentage: Double = 0.0
    @Published var fatsPercentage: Double = 0.0
    @Published var nutritionElements = NutritionElements()
    
    let meals = ProductMock.shared
 
//    var totalEnergy : Int {
//        
//        var result = 0
//        for meal in meals {
//            result += meal.totalEnergy
//        }
//        return result 
//    }
    
    
    init(planProfile: PlanProfile) {
        self.planProfile = planProfile
      
    }
    
    func calculatePercentage() {
        let totalProtein = ProductMock.shared.totalProtein
        let totalCarbs = ProductMock.shared.totalCarbs
        let totalFats = ProductMock.shared.totalFats

        guard totalProtein > 0 && totalCarbs > 0 && totalFats > 0 else {
            // Защита от деления на ноль или отрицательных значений
            return
        }

        let consumedProtein = consumed.reduce(0) { $0 + $1.protein }
        let consumedCarbs = consumed.reduce(0) { $0 + $1.carbs }
        let consumedFats = consumed.reduce(0) { $0 + $1.fats }

        proteinPercentage = Double(consumedProtein) / Double(totalProtein) * 100
        carbsPercentage = Double(consumedCarbs) / Double(totalCarbs)  * 100
        fatsPercentage = Double(consumedFats) / Double(totalFats)  * 100
    }

   
        
    }
   

