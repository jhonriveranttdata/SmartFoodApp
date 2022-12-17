//
//  ListFoodRouter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//

import Foundation
import UIKit


class ListFoodRouter {
    
    var presenter : ListFoodPresenterProtocol?
    var detailsFoodConfigurator: DetailsFoodConfigurator?
    var view: UIViewController?
    
    required init(presenter: ListFoodPresenterProtocol) {
        self.presenter = presenter
    }
}
extension ListFoodRouter : ListFoodRouterProtocol{
    
    func presetFoodDetail(_ food: FoodEntity) {
        detailsFoodConfigurator = DetailsFoodConfigurator()
        let detailsFoodViewController = detailsFoodConfigurator!.make(food)
        view?.navigationController?.pushViewController(detailsFoodViewController, animated: true)
    }
    
    func mostrar(_ food: FoodEntity){
        let viewController = UIViewController()
        view?.present(viewController, animated: true)
    }
}


