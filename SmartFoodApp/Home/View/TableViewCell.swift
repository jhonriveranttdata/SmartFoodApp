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
    
    func loadFrom(URLAddress: String) {
        if let url = URL(string: URLAddress) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Error handling...
                guard let imageData = data else { return }
                
                DispatchQueue.main.async {
                    self.imageCategory.image = UIImage(data: imageData)
                }
            }.resume()
        }
    }
    
    func setupViewCellCategory(category: CategoryEntity){
        loadFrom(URLAddress: category.imgName)
        nombreCategoriaLabel.text = category.nombre
    }
}

