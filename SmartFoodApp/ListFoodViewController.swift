//
//  ListFoodViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class ListFoodViewController: UIViewController {
 
    var arrayFood = [
        FoodModel(nameFood: "plato1", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.6),
        FoodModel(nameFood: "plato2", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.2),
        FoodModel(nameFood: "plato3", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.3),
        FoodModel(nameFood: "plato4", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.0),
        FoodModel(nameFood: "plato5", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.3),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    func configureTableViewCell(){
        tableView.rowHeight = 150
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension ListFoodViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellFood", for: indexPath) as? FoodTableViewCell{
            configureTableViewCell()
            let food = arrayFood[indexPath.row]
            cell.setupViewCell(food: food)
           // cell.delegate = self
            return cell
        }else{
           return UITableViewCell()
        }
      
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodRow = arrayFood[indexPath.row]
        guard let modalFoodDetails = storyboard?.instantiateViewController(withIdentifier: "ModalFoodDetailsViewController") as? ModalFoodDetailsViewController else { return }
        modalFoodDetails.nameFood = foodRow.nameFood
        modalFoodDetails.categoryFood = foodRow.category
        present(modalFoodDetails, animated: true)
        
    }
    

}

