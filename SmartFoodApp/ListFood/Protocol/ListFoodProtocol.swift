//
//  ListFoodProtocol.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import Foundation
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

    func showFoodSelected(_ food: FoodEntity)
}
//Router -> Presenter
protocol ListFoodRouterProtocol{
    func presetFoodDetail(_ food: FoodEntity)
}
//Interactor -> Presenter
/*
protocol ListFoodInteractorProtocol{
    func getDataFood()
}
//Router -> Presenter
protocol ListFoodRouterProtocol{
    func presetFoodDetail(_ food: FoodEntity)
}
    
//Presenter -> Interactor{
protocol ListFoodPresenterOutPutInteractor{
    func getDataFood(_ foods: [FoodEntity])
}

//Interactor -> Networking
protocol ListFoodRemoteRepositoryProtocol{
    func FetchFoods() -> [FoodResponse]
}*/
