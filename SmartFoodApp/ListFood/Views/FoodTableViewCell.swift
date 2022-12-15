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

    func setupViewCell(food:FoodEntity){
 
        DispatchQueue.main.async {
            let url = URL(string: food.imgName)
            if let data = try? Data(contentsOf: url!){
                self.imageFoodCell.image = UIImage(data: data)
            }
        }
        
       
 

        nameFoodCell.text = food.nombre
        
        descriptionFoodCellLabel.text = food.dato
        scoreFoodCellLabel.text = String(food.puntuacion)
        categoryFoodCellLabel.text = food.categoria
    }
}
