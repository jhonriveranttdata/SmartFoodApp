//
//  PreparationFoodPresenter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 15/12/22.
//

import Foundation
import UIKit

class PreparationFoodPresenter{
    private let itemPreparation : FoodEntity
    required init(itemPreparation: FoodEntity) {
        self.itemPreparation = itemPreparation
    }
}

extension PreparationFoodPresenter : PreparationFoodPresenterProtocol {
    var preparation: FoodEntity{
        itemPreparation
    }
}
