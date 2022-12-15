//
//  ListFoodPresenter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//

import Foundation
import UIKit
class ListFoodPresenter {
    //MARK: PROPIEDADES
    
    private let itemCategory: CategoryEntity?
    private let listFood: [FoodEntity]
    var router : ListFoodRouterProtocol?
    var view : ListFoodViewProtocol?
    
    required init(itemCategory: CategoryEntity?, listFood: [FoodEntity]) {
        self.itemCategory = itemCategory
        self.listFood = listFood
    }
}

//MARK: MÉTODOS DE PROTOCOLOS PARA LA VISTA
extension ListFoodPresenter : ListFoodPresenterProtocol{
    var arrayCategory: CategoryEntity?{
        return itemCategory
    }
    var arrayFood: [FoodEntity]{
        return listFood
    }

    func filterCategory()-> [FoodEntity]{
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
    var food : [FoodEntity]{
        return filterCategory()
    }
    func showFoodSelected(_ food: FoodEntity){
        router?.presetFoodDetail(food)
    }
  /*  func filterCategory(){
        
    }

    func obtenerData(){
       // interactor?.getDataFood()
    }
    
    func getDataFood(_ foods: [FoodEntity]) {
       // view?.showFoods(foods)
    }*/
    
    /*
    func searchTextField(_ searchFoodTextField: UITextField ){
        searchFoodTextField.addTarget(self, action:#selector(searchTextFieldFn), for: .editingChanged)
    }
    @objc func searchTextFieldFn(_ searchFoodTextField: UITextField, _ searchingFood: Bool){
          foodArrayFiltered.removeAll()
        let searchData: Int = searchFoodTextField.text!.count
          if searchData != 0 {
              searchingFood = true
              for food in arrayFood{
                  if let searchToFood = searchFoodTextField.text{
                      let range = listFood.nameFood.range(of: searchToFood, options: .caseInsensitive)
                      if range != nil{
                          foodArrayFiltered.append(food)
                      }
                  }
              }
          }else{
              foodArrayFiltered = arrayFood
              searchingFood = false
          }
              tableView.reloadData()
      }
     */
}
