//
//  FoodModel.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 4/12/22.
//

import Foundation

struct FoodModel: Codable {
    var nameFood:String
    var descriptionFood:String
    var recommendation:Bool
    var category:String
    var score:Float
    var foodFavorite: Bool
    
    init(nameFood: String, descriptionFood: String, recommendation: Bool, category: String, score: Float, foodFavorite:Bool) {
        self.nameFood = nameFood
        self.descriptionFood = descriptionFood
        self.recommendation = recommendation
        self.category = category
        self.score = score
        self.foodFavorite = foodFavorite
    }
    init(){
        self.nameFood = ""
        self.descriptionFood = ""
        self.recommendation = false
        self.category = ""
        self.score = 0
        self.foodFavorite = false
    }
}
extension FoodModel: Identifiable{
    var id: UUID{
        let id = UUID()
        return id
    }
}
