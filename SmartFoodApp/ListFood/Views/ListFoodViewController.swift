import UIKit

class ListFoodViewController: UIViewController {
    var presenter:ListFoodPresenterProtocol?
    var foodList: [FoodEntity]?
    //var foodArrayFiltered = [FoodModel]()
    var searchingFood = false
    @IBOutlet private weak var searchFoodTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    func configureTableViewCell(){
        tableView.rowHeight = 150
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //searchFoodTextField.addTarget(self, action:(presenter?.searchTextFieldFn(_:_:)), for: .editingChanged)
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.filterCategory()
        //presenter?.search(searchFoodTextField)
    }
    
    /*  @objc func searchTextField(sender: UITextField){
     foodArrayFiltered.removeAll()
     let searchData: Int = searchFoodTextField.text!.count
     if searchData != 0{
     searchingFood = true
     for food in arrayFood{
     if let searchToFood = searchFoodTextField.text{
     let range = food.nameFood.range(of: searchToFood, options: .caseInsensitive)
     if range != nil{
     foodArrayFiltered.append(food)
     }
     }
     }
     }else{
     foodArrayFiltered = arrayFood
     searchingFood = false
     }
     tableView.reloadData()
     }*/
}

extension ListFoodViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let countFood = searchingFood ? foodArrayFiltered.count : foodList!.count
        //return countFood
        let foodcount = presenter?.food.count
        //print("esto es foodlist \(presenter?.arrayFood)")
        return foodcount != nil ? foodcount! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellFood", for: indexPath) as? FoodTableViewCell{
            //let valueFood = searchingFood ? foodArrayFiltered[indexPath.row] : foodList![indexPath.row]
            //let food = foodList![indexPath.row]
            //var list = presenter?.arrayFood
            let foodPresenter = presenter?.food
            //let filtro = foodList?.filter{$0.categoria == presenter?.arrayCategory.nombre}
            //print(filtro)
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
        print(foods.count)
        foodList = foods
    }
    
    func showFoodSelected(_ food: FoodEntity) {
        
    }
    
    func showFoods(_ foods: [FoodEntity]) {
        //foodList = foods
        tableView.reloadData()
    }
    
    
}
