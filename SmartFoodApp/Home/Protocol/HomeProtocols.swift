//
//  HomeProtocols.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import Foundation
//View -> Presenter
protocol HomeViewProtocol{
    func showUser(_ user: [UserEntity])
    func showCategory(_ category: [CategoryEntity])
    func showFood(_ food: [FoodEntity])

}
//Presenter -> View
protocol HomePresenterProtocol{
    func getDataUser(_ user : [UserEntity])
    func getDataCategory(_ category : [CategoryEntity])
    func getDataFood(_ food: [FoodEntity])
    func obtenerData()
    func showCategorySelected(_ category: CategoryEntity?,_ listFood: [FoodEntity])
}
//interactor -> presenter
protocol HomeInteractorProtocol{
    func getDataUser()
    func getDataCategory()
    func getDataFood()
}
//router -> presenter
protocol HomeRouterProtocol{
    func presetCategory(_ category: CategoryEntity?,_ listFood: [FoodEntity])
}

protocol HomeRemoteRepositoryProtocol{
    func FetchUser()->[UserResponse]
    func FetchCategoryFoods()->[CategoryFoods]
    func FetchFoods()->[FoodResponse]
}
