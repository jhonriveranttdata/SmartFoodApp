//
//  DetailsFoodRouter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import Foundation
import UIKit

class DetailsFoodRouter{
    var presenter : DetailsFoodPresenterProtocol?
    var dateFoodConfigurator: DateFoodConfigurator?
    var view: UIViewController?
    //var delegate: DetailsFoodConfiguratorDelegate
    
    required init(presenter: DetailsFoodPresenterProtocol) {
        self.presenter = presenter
    }
}
extension DetailsFoodRouter : DetailsFoodRouterProtocol{
    func presentFoodDate(_ food: FoodEntity) {
        dateFoodConfigurator = DateFoodConfigurator()
        let  dateFoodViewController = dateFoodConfigurator!.make(food)
        view?.present(dateFoodViewController, animated: true)
    }
}
