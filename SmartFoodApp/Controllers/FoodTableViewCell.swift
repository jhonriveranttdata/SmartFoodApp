//
//  FoodTableViewCell.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit


class FoodTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet private weak var nameFoodCell: UILabel!
    @IBOutlet private weak var categoryFoodCellLabel: UILabel!
    @IBOutlet private weak var imageFoodCell: UIImageView!
    @IBOutlet private weak var descriptionFoodCellLabel: UILabel!
    @IBOutlet private weak var scoreFoodCellLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupViewCell(food:FoodModel){
        nameFoodCell.text = food.nameFood
        descriptionFoodCellLabel.text = food.descriptionFood
        scoreFoodCellLabel.text = String(food.score)
        categoryFoodCellLabel.text = food.category
    }
}
