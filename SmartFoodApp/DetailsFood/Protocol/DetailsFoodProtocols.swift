//
//  DetailsFoodProtocols.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import Foundation
import UIKit
protocol DetailsFoodPresenterProtocol{
    var arrayFood: FoodEntity {get}
    func showFoodDate(_ food: FoodEntity)
}

protocol DetailsFoodRouterProtocol{
    func presentFoodDate (_ food: FoodEntity)
}
public protocol DetailsFoodConfiguratorDelegate{
    func detailsFoodConfigurator(didDismiss viewController: UIViewController)
}
