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
        //collectionView.delegate = self
        //collectionView.dataSource = self
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
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
/*
 extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return foodList != nil ? foodList!.count : 0
 }
 
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
 var str = foodList?[collectionView.tag].imgName
 let url = URL(string: str!)
 if let data = try? Data(contentsOf: url!){
 var img = UIImage(data: data)
 cell.image.image = UIImage(named: img[indexPath.row] )
 }
 return cell
 }
 
 
 }
 extension TableViewCell: HomeViewProtocol{
 func showUser(_ user: [UserEntity]) {
 print(user)
 }
 
 func showCategory(_ category: [CategoryEntity]) {
 print(category)
 }
 
 func showFood(_ food: [FoodEntity]) {
 foodList = food
 }
 
 
 }
 */
