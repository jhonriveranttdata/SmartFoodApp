//
//  HomeConfigurator.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//

import Foundation
import UIKit

class HomeConfgurator{
    
    static func makeHome() -> UIViewController{
        let presenter = HomePresenter()
        let api = FoodMocksAPI()
        let interactor = HomeInteractor(presenter: presenter, api: api)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let router = HomeRouter(presenter: presenter)
        
        router.presenter = presenter
        router.view = view
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
       
        return view
    }
}

