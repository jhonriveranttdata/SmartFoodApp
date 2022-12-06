//
//  ModalFoodDetailsViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class ModalFoodDetailsViewController: UIViewController {

    
    @IBOutlet private weak var foodImage: UIImageView!
    @IBOutlet private weak var nameFoodLabel: UILabel!
    @IBOutlet private weak var categoryFoodLabel: UILabel!
    @IBOutlet private weak var ingredientsTextView: UITextView!
    @IBOutlet private weak var saveImgFavoriteButton: UIButton!
    var favorite = false
    @IBAction func saveFavoriteButton(_ sender: UIButton) {
            saveImgFavoriteButton.setImage(UIImage( systemName:"heart.fill"), for: .normal)
    }
    var receivedFood: FoodModel = FoodModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameFoodLabel.text = receivedFood.nameFood
        categoryFoodLabel.text = receivedFood.category
        ingredientsTextView.text = receivedFood.ingredients
    }
}
