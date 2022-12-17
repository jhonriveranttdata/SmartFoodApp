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
    var presenter: DetailsFoodPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let str = presenter?.arrayFood.imgName{
            foodImage.image = UIImage(named: str)
        }
        nameFoodLabel.text = presenter?.arrayFood.nombre
        categoryFoodLabel.text = presenter?.arrayFood.categoria
        ingredientsTextView.text = presenter?.arrayFood.ingredientes
        presenter?.arrayFood.favorite == true ?  saveImgFavoriteButton.setImage(UIImage( systemName:"heart.fill"), for: .normal) :  saveImgFavoriteButton.setImage(UIImage( systemName:"heart"), for: .normal)
    }
    
    @IBAction func initPreparation(_ sender: UIButton) {
        guard let food = presenter?.arrayFood else { return }
        presenter?.showFoodPreparation(food)
    }
    
    @IBAction func notificationButton(_ sender: UIButton) {
        guard let food = presenter?.arrayFood else { return }
        presenter?.showFoodDate(food)
    }
    
    @IBAction func saveFavoriteButton(_ sender: UIButton) {
        saveImgFavoriteButton.setImage(UIImage( systemName:"heart.fill"), for: .normal)
    }
    

}

