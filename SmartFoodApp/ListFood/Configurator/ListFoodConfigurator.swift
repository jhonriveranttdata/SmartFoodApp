//
//  ListFoodConfigurator.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import Foundation
import UIKit

class ListFoodConfgurator{
    
    func makeListFood(_ item: CategoryEntity?,_ itemFood: [FoodEntity] )-> UIViewController{
        
        let presenter = ListFoodPresenter(itemCategory: item, listFood: itemFood,foodArrayFiltered:itemFood ,backupFoodArray :itemFood)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ListFoodViewController") as! ListFoodViewController
        let router = ListFoodRouter(presenter: presenter)
        
       router.presenter = presenter
        router.view = view
        presenter.router = router
        presenter.view = view
        view.presenter = presenter
        return view
    }
}
