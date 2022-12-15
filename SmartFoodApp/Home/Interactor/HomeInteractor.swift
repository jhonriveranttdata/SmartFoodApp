//
//  HomeInteractor.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//

import Foundation

class HomeInteractor {
    var presenter : HomePresenterProtocol?
    var api: HomeRemoteRepositoryProtocol?
    required init(presenter: HomePresenterProtocol, api:HomeRemoteRepositoryProtocol) {
        self.presenter = presenter
        self.api = api
    }
}

extension HomeInteractor : HomeInteractorProtocol{
    func getDataFood() {
        if let food = api?.FetchFoods(){
            let myFoods = FoodEntity.make(food)
            presenter?.getDataFood(myFoods)
        }
    }
    func getDataUser(){
        if let user = api?.FetchUser(){
            let myUsers = UserEntity.make(user)
            presenter?.getDataUser(myUsers)
        }
    }
    func getDataCategory(){
        if let category = api?.FetchCategoryFoods(){
            let myCategory = CategoryEntity.make(category)
            presenter?.getDataCategory(myCategory)
        }
    }
}
