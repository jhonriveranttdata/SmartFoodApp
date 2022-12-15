//
//  ModalFoodDetailsViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class ModalFoodDetailsViewController: UIViewController {
    var presenter: DetailsFoodPresenterProtocol?
    
    @IBOutlet private weak var foodImage: UIImageView!
    @IBOutlet private weak var nameFoodLabel: UILabel!
    @IBOutlet private weak var categoryFoodLabel: UILabel!
    @IBOutlet private weak var ingredientsTextView: UITextView!
    @IBOutlet private weak var saveImgFavoriteButton: UIButton!
    
    var favorite = false
    @IBAction func notificationButton(_ sender: UIButton) {
        guard let food = presenter?.arrayFood else { return }
        presenter?.showFoodDate(food)
    }
    @IBAction func saveFavoriteButton(_ sender: UIButton) {
       
            saveImgFavoriteButton.setImage(UIImage( systemName:"heart.fill"), for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let str = presenter?.arrayFood.imgName
        let url = URL(string: str!)
        if let data = try? Data(contentsOf: url!){
            foodImage.image = UIImage(data: data)
        }
        nameFoodLabel.text = presenter?.arrayFood.nombre
        categoryFoodLabel.text = presenter?.arrayFood.categoria
        ingredientsTextView.text = presenter?.arrayFood.ingredientes
        presenter?.arrayFood.favorite == true ?  saveImgFavoriteButton.setImage(UIImage( systemName:"heart.fill"), for: .normal) :  saveImgFavoriteButton.setImage(UIImage( systemName:"heart"), for: .normal)
    }
}

