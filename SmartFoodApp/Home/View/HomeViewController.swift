//
//  HomeViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var avatarUIImageView: UIImageView!
    @IBOutlet weak var nameUserLabel: UILabel!
    private var userList:[UserEntity]?
    private var categoryList:[CategoryEntity]?
    private var foodList:[FoodEntity]!
    private var allFood: [FoodEntity]!
    var presenter: HomePresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBAction func searchAll(_ sender: UIButton) {
        let category : CategoryEntity? = nil
        presenter?.showCategorySelected(category,foodList)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        presenter?.obtenerData()
        DispatchQueue.main.async {
            let user = self.userList?[0].avatar
            self.activity.startAnimating()
            let url = URL(string: user!)
            if let data = try? Data(contentsOf: url!){
                self.avatarUIImageView.image = UIImage(data: data)
                self.avatarUIImageView.layer.cornerRadius = 8.5
                self.activity.stopAnimating()
                self.activity.hidesWhenStopped = true
            }
        }
    }
    
}
extension HomeViewController: HomeViewProtocol{
    func showFood(_ food: [FoodEntity]) {
        foodList = food
    }
    
    func showCategory(_ category: [CategoryEntity]) {
        categoryList = category
    }
    
    func showUser(_ user: [UserEntity]) {
        userList = user
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList != nil ? categoryList!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell{
            let category = categoryList![indexPath.row]
            cell.setupViewCellCategory(category: category)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoryList![indexPath.row]
        presenter?.showCategorySelected(category,foodList)
    }
}

