//
//  DetailsFoodPresenter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import Foundation

class DetailsFoodPresenter{
    private let itemDetail: FoodEntity
    var router: DetailsFoodRouterProtocol?
    required init(itemDetail: FoodEntity) {
        self.itemDetail = itemDetail
    }

}
extension DetailsFoodPresenter: DetailsFoodPresenterProtocol{
    var arrayFood: FoodEntity {
        itemDetail
    }
    func showFoodDate(_ food: FoodEntity){
        router?.presentFoodDate(food)
    }
}
