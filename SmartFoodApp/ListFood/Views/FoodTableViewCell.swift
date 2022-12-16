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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func loadFrom(URLAddress: String) {
        if let url = URL(string: URLAddress) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Error handling...
                guard let imageData = data else { return }
                
                DispatchQueue.main.async {
                    self.imageFoodCell.image = UIImage(data: imageData)
                }
            }.resume()
        }
    }
    func setupViewCell(food:FoodEntity){
        loadFrom(URLAddress: food.imgName)
        nameFoodCell.text = food.nombre
        descriptionFoodCellLabel.text = food.dato
        scoreFoodCellLabel.text = String(food.puntuacion)
        categoryFoodCellLabel.text = food.categoria
    }
}
