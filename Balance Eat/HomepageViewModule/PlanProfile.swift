//
//  PlanProfile.swift
//  Balance Eat
//
//  Created by Муса Шогенов on 22.01.2024.
//
import SwiftUI
import Foundation


 final class PlanProfile: ObservableObject {
    
    let startWeight: Double
    let goalWeight: Double
     let shownCurrentWeight: Double
   @Published var currentWeight: Double
    
    
    
    
    init(start: Double, goal: Double, current: Double) {
        self.startWeight = start
        self.goalWeight = goal
        self.currentWeight = 0
        self.shownCurrentWeight = current
    }
    
    
    
    
    
    
    
}
