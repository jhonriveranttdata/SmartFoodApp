//
//  DateFoodConfigurator.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 14/12/22.
//

import Foundation
import UIKit
class DateFoodConfigurator {
    func make(_ itemDate: FoodEntity) -> UIViewController {
        let presenter = DateFoodPresenter(itemDate: itemDate)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DateFoodViewController") as! DateFoodViewController
        view.presenter = presenter
        return view
    }
}
