//
//  ListFoodConfigurator.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import Foundation
import UIKit
class ListFoodConfgurator{
    
    func makeListFood(_ item: CategoryEntity?,_ itemFood: [FoodEntity])-> UIViewController{
         let presenter = ListFoodPresenter(itemCategory: item, listFood: itemFood)
        //let api = FoodMocksAPI()
        //var cat = item.nombre
       // let interactor = ListFoodInteractor(presenter: presenter, api: api)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ListFoodViewController") as! ListFoodViewController
       let router = ListFoodRouter(presenter: presenter)
        
       router.presenter = presenter
        router.view = view
        presenter.router = router
        //presenter.interactor = interactor
        presenter.view = view
        view.presenter = presenter
        return view
    }
   /* static func makeListFood()-> UIViewController{
        let presenter = ListFoodPresenter()
        let api = FoodMocksAPI()
        let interactor = ListFoodInteractor(presenter: presenter, api: api)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ListFoodViewController") as! ListFoodViewController
        let router = ListFoodRouter(presenter: presenter)
        
        router.presenter = presenter
        router.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        view.presenter = presenter
        return view
    }*/
}
