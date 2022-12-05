//
//  SearchFoodViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class SearchFoodViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchFoodTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    var arrayFood = [
        FoodModel(nameFood: "plato1", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.6),
        FoodModel(nameFood: "plato2", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.2),
        FoodModel(nameFood: "plato3", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.3),
        FoodModel(nameFood: "plato4", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.0),
        FoodModel(nameFood: "plato5", descriptionFood: "este es un buen plato", recommendation: true, category:"Segundo", score:4.3),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    



}
