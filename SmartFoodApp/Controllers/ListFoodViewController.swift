//
//  ListFoodViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class ListFoodViewController: UIViewController {
 
    var arrayFood : [FoodModel] = [
        FoodModel(nameFood: "Arroz con pollo", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.6, foodFavorite: true),
        FoodModel(nameFood: "Ají de gallina", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.2, foodFavorite: false),
        FoodModel(nameFood: "Arroz chaufa", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.3, foodFavorite: true),
        FoodModel(nameFood: "Caldo de gallina", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.0, foodFavorite: false),
        FoodModel(nameFood: "Rocoto Relleno", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.3, foodFavorite: false)
    ]
    var foodArrayFiltered = [FoodModel]()
    var searchingFood = false
    @IBOutlet weak var searchFoodTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    func configureTableViewCell(){
        tableView.rowHeight = 150
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFoodTextField.addTarget(self, action:#selector(searchTextField), for: .editingChanged)
        tableView.dataSource = self
        tableView.delegate = self
    }
    @objc func searchTextField(sender: UITextField){
        foodArrayFiltered.removeAll()
        let searchData: Int = searchFoodTextField.text!.count
        if searchData != 0{
            searchingFood = true
            for food in arrayFood{
                if let searchToFood = searchFoodTextField.text{
                    let range = food.nameFood.range(of: searchToFood, options: .caseInsensitive)
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
}

extension ListFoodViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countFood = searchingFood ? foodArrayFiltered.count : arrayFood.count
        return countFood
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellFood", for: indexPath) as? FoodTableViewCell{
            let valueFood = searchingFood ? foodArrayFiltered[indexPath.row] : arrayFood[indexPath.row]
            cell.setupViewCell(food: valueFood)
            configureTableViewCell()
            return cell
        }else{
           return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let modalFoodDetails = storyboard?.instantiateViewController(withIdentifier: "ModalFoodDetailsViewController") as? ModalFoodDetailsViewController else { return }
        let sendValueModal = searchingFood ? foodArrayFiltered[indexPath.row] : arrayFood[indexPath.row]
        modalFoodDetails.receivedFood = sendValueModal
        present(modalFoodDetails, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        searchFoodTextField.resignFirstResponder()
        return true
    }
}

