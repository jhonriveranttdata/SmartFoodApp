//
//  ListFoodPresenter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//

import Foundation
import UIKit

class ListFoodPresenter {

    private let itemCategory: CategoryEntity?
    private var listFood: [FoodEntity]
    private var foodArrayFiltered :[FoodEntity]
    private let backupFoodArray: [FoodEntity]
    var router : ListFoodRouterProtocol?
    var view : ListFoodViewProtocol?
    
    required init(itemCategory: CategoryEntity?, listFood: [FoodEntity], foodArrayFiltered:[FoodEntity],backupFoodArray : [FoodEntity] ) {
        self.itemCategory = itemCategory
        self.listFood = listFood
        self.foodArrayFiltered = foodArrayFiltered
        self.backupFoodArray = backupFoodArray
    }
}

extension ListFoodPresenter : ListFoodPresenterProtocol{
    
    var arrayCategory: CategoryEntity?{
        return itemCategory
    }
    
    var arrayFood: [FoodEntity]{
        return listFood
    }
    
    var food : [FoodEntity]{
        return filterCategory()
    }
    
    func filterCategory() -> [FoodEntity]{
        if itemCategory != nil {
            let filter = listFood.filter{$0.idcategoria == itemCategory?.id}
            view?.searchData(filter)
            return filter
        }else{
            let filter = listFood
            view?.searchData(filter)
            return filter
        }
    }
    
    func showFoodSelected(_ food: FoodEntity){
        router?.presetFoodDetail(food)
    }
    
    func searchFood(_ text: String){
        foodArrayFiltered.removeAll()
        //listFood.removeAll()
        arrayFood.forEach({value in
            if value.nombre.lowercased().contains(text.lowercased()){
                foodArrayFiltered.append(value)
            }
        })
        listFood = (text.count > 0 ) ? foodArrayFiltered : backupFoodArray
    }
}
