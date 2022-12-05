//
//  FoodModel.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 4/12/22.
//

import Foundation

class FoodModel {
    var nameFood:String
    var descriptionFood:String
    var recommendation:Bool
    var category:String
    var score:Float
    init(nameFood: String, descriptionFood: String, recommendation: Bool, category: String, score: Float) {
        self.nameFood = nameFood
        self.descriptionFood = descriptionFood
        self.recommendation = recommendation
        self.category = category
        self.score = score
    }
    init(){
        self.nameFood = ""
        self.descriptionFood = ""
        self.recommendation = false
        self.category = ""
        self.score = 0
    }
}
