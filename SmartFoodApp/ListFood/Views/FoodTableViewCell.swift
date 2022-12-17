//
//  FoodTableViewCell.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameFoodCell: UILabel!
    @IBOutlet private weak var categoryFoodCellLabel: UILabel!
    @IBOutlet private weak var imageFoodCell: UIImageView!
    @IBOutlet private weak var descriptionFoodCellLabel: UILabel!
    @IBOutlet private weak var scoreFoodCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
  
    func setupViewCell(food:FoodEntity){
        imageFoodCell.image = UIImage(named: food.imgName)
        nameFoodCell.text = food.nombre
        descriptionFoodCellLabel.text = food.dato
        scoreFoodCellLabel.text = String(food.puntuacion)
        categoryFoodCellLabel.text = food.categoria
    }
}
