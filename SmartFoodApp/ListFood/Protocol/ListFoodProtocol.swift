//
//  ListFoodProtocol.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import Foundation
import UIKit
//View -> Presenter
protocol ListFoodViewProtocol{
    func searchData(_ foods: [FoodEntity])
    func showFoods(_ foods: [FoodEntity])
    func showFoodSelected(_ food: FoodEntity)
}
//Presenter -> View
protocol ListFoodPresenterProtocol{
    var arrayCategory: CategoryEntity? {get}
    var arrayFood: [FoodEntity] {get}
    func filterCategory()-> [FoodEntity]
    var food : [FoodEntity]{get}
    func searchFood(_ text: String)
    func showFoodSelected(_ food: FoodEntity)
}
//Router -> Presenter
protocol ListFoodRouterProtocol{
    func presetFoodDetail(_ food: FoodEntity)
}
