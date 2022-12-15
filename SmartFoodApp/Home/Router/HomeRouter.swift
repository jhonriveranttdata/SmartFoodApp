//
//  HomeRouter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//

import Foundation
import UIKit

class HomeRouter{
    var presenter : HomePresenter?
    var listConfigurator: ListFoodConfgurator?
    var view: UIViewController?
    required init(presenter: HomePresenter) {
        self.presenter = presenter
    }
}

extension HomeRouter : HomeRouterProtocol{
    func presetCategory(_ category: CategoryEntity,_ listFood : [FoodEntity]){
        listConfigurator = ListFoodConfgurator()
        let listFoodViewController = listConfigurator!.makeListFood(category, listFood)
        view?.navigationController?.pushViewController(listFoodViewController, animated: true)
        //view?.present(listFoodViewController, animated: true)
    }
    func mostrar(_ food: FoodEntity){
        let viewController = UIViewController()
        view?.present(viewController, animated: true)
    }
}
