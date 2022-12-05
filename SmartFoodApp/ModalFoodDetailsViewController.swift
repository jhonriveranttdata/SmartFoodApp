//
//  ModalFoodDetailsViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class ModalFoodDetailsViewController: UIViewController {

    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var nameFoodLabel: UILabel!
    @IBOutlet weak var categoryFoodLabel: UILabel!
    
    var receivedFood: FoodModel = FoodModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameFoodLabel.text = receivedFood.nameFood
        categoryFoodLabel.text = receivedFood.category
    }
}
