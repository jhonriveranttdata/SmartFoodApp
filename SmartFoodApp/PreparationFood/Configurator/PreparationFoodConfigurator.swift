//
//  PreparationFoodConfigurator.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 15/12/22.
//

import Foundation
import UIKit
class PreparationFoodConfigurator {
    func make(_ itemPreparation: FoodEntity)-> UIViewController {
        let presenter = PreparationFoodPresenter(itemPreparation: itemPreparation)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PreparationFoodViewController") as! PreparationFoodViewController
        view.presenter = presenter
        return view
    }
}
