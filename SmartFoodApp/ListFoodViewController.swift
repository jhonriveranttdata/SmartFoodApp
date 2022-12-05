//
//  ListFoodViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class ListFoodViewController: UIViewController {
 
    var arrayFood = [FoodModel]()
    var foodArrayFiltered = [FoodModel]()
    var searchingFood = false
    @IBOutlet weak var searchFoodTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    func configureTableViewCell(){
        tableView.rowHeight = 150
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        searchFoodTextField.addTarget(self, action:#selector(searchTextField), for: .editingChanged)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    @objc func searchTextField(sender: UITextField){
        foodArrayFiltered.removeAll()
        let searchData: Int = searchFoodTextField.text!.count
        if searchData != 0{
            searchingFood = true
            var i: Int = 0
            for food in arrayFood{
                if let searchToFood = searchFoodTextField.text{
                    let range = food.nameFood.lowercased().range(of: searchToFood, options: .caseInsensitive, range: nil,locale: nil)
                    if range != nil{
                        foodArrayFiltered.append(food)
                    }
                }
                i = i + 1
            }
        }else{
            foodArrayFiltered = arrayFood
            searchingFood = false
        }
      
            tableView.reloadData()
    }
    private func fillData()
    {

        let plato1 = FoodModel(nameFood: "Arroz con pollo", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.6)
        arrayFood.append(plato1)
        let plato2 = FoodModel(nameFood: "Ají de gallina", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.2)
        arrayFood.append(plato2)
        let plato3 = FoodModel(nameFood: "Arroz chaufa", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.3)
        arrayFood.append(plato3)
        let plato4 = FoodModel(nameFood: "Caldo de gallina", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.0)
        arrayFood.append(plato4)
        let plato5 = FoodModel(nameFood: "Rocoto Relleno", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.3)
        arrayFood.append(plato5)
    }
}


extension ListFoodViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchingFood {
            return foodArrayFiltered.count
        }else{
            return arrayFood.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellFood", for: indexPath) as? FoodTableViewCell{
            
            if searchingFood{
                configureTableViewCell()
                let food = foodArrayFiltered[indexPath.row]
                cell.setupViewCell(food: food)
            }else {
                configureTableViewCell()
                let food = arrayFood[indexPath.row]
                cell.setupViewCell(food: food)
            }
            return cell
            
        }else{
           
           return UITableViewCell()
        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let modalFoodDetails = storyboard?.instantiateViewController(withIdentifier: "ModalFoodDetailsViewController") as? ModalFoodDetailsViewController else { return }
        
        if searchingFood{
            modalFoodDetails.receivedFood = foodArrayFiltered[indexPath.row]
        }else{
            modalFoodDetails.receivedFood = arrayFood[indexPath.row]
        }
        present(modalFoodDetails, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        searchFoodTextField.resignFirstResponder()
        return true
    }
}

