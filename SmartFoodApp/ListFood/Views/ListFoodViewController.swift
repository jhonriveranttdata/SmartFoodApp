import UIKit

class ListFoodViewController: UIViewController {
    var presenter:ListFoodPresenterProtocol?
    var foodList: [FoodEntity]?
    var searchingFood = false
    @IBOutlet private weak var searchFoodTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        presenter?.filterCategory()
    }
    
    @IBAction func searchTextField(_ textField: UITextField) {
        if textField == searchFoodTextField{
            let text = textField.text ?? ""
            presenter?.searchFood(text)
            tableView.reloadData()
        }
    }
    
    func configureTableViewCell(){
        tableView.rowHeight = 150
    }
}

extension ListFoodViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let foodcount = presenter?.food.count
        return foodcount != nil ? foodcount! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellFood", for: indexPath) as? FoodTableViewCell{
            let foodPresenter = presenter?.food
            let food = foodPresenter![indexPath.row]
            cell.setupViewCell(food: food)
            configureTableViewCell()
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodPresenter = presenter?.food
        let food = foodPresenter![indexPath.row]
        presenter?.showFoodSelected(food)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        searchFoodTextField.resignFirstResponder()
        return true
    }
}

extension ListFoodViewController: ListFoodViewProtocol{
    func searchData(_ foods: [FoodEntity]) {
        foodList = foods
    }
    
    func showFoodSelected(_ food: FoodEntity) {
        
    }
    
    func showFoods(_ foods: [FoodEntity]) {
        tableView.reloadData()
    }
    
    
}
