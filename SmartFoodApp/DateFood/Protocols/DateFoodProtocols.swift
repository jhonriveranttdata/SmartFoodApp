//
//  DateFoodProtocols.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 14/12/22.
//

import Foundation
import UIKit

protocol DateFoodPresenterProtocol{
    var arrayFood: FoodEntity{get}
    func createNotification(date :UIDatePicker)
}
protocol DateFoodRouterProtocol{
    func dismiss()
}

public protocol DateFoodConfiguratorDelegate{
    func dateFoodConfigurator(didDismiss viewcontroller: UIViewController)
}
