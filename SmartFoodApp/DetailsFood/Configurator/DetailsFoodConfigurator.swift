//
//  DetailsFoodConfigurator.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import Foundation
import UIKit

class DetailsFoodConfigurator {
    
    func make(_ item: FoodEntity) -> UIViewController {
        let presenter = DetailsFoodPresenter(itemDetail: item)
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ModalFoodDetailsViewController") as! ModalFoodDetailsViewController
        view.presenter = presenter
        let router = DetailsFoodRouter(presenter: presenter)
        router.presenter = presenter
        router.view = view
        presenter.router = router
        return view
    }
}
