//
//  HomePresenter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//

import Foundation

class HomePresenter{
    var view : HomeViewProtocol?
    var interactor : HomeInteractorProtocol?
    var router : HomeRouterProtocol?
}

extension HomePresenter : HomePresenterProtocol{
    
    func showCategorySelected(_ category: CategoryEntity?,_ listFood: [FoodEntity]){
        router?.presetCategory(category, listFood)
    }
    func getDataFood(_ food: [FoodEntity]) {
        view?.showFood(food)
    }
    
    func getDataCategory(_ category: [CategoryEntity]) {
        view?.showCategory(category)
    }
    
    func getDataUser(_ user: [UserEntity]) {
        view?.showUser(user)
    }
    func obtenerData(){
        interactor?.getDataUser()
        interactor?.getDataCategory()
        interactor?.getDataFood()
    }
}
