//
//  DateFoodPresenter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 14/12/22.
//

import Foundation
class DateFoodPresenter{
    private let itemDate: FoodEntity
    var router: DateFoodRouterProtocol?
    required init(itemDate: FoodEntity) {
        self.itemDate = itemDate
    }
}
extension DateFoodPresenter: DateFoodPresenterProtocol{
    var arrayFood: FoodEntity {
        itemDate
    }
    
   
}
