//
//  TableViewCell.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 14/12/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private var foodList:[FoodEntity]?
    @IBOutlet weak var imageCategory: UIImageView!
    @IBOutlet weak var nombreCategoriaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupViewCellCategory(category: CategoryEntity){
        imageCategory.image = UIImage(named: category.imgName)
        nombreCategoriaLabel.text = category.nombre
    }
}

