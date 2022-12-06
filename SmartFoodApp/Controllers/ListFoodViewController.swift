import UIKit

class ListFoodViewController: UIViewController {
 
    var arrayFood : [FoodModel] = [
        FoodModel(nameFood: "Arroz con pollo", descriptionFood: "Esto es un arroz con pollo", recommendation: true, category:"Plato principal", score:4.6, foodFavorite: true,ingredients: "4 piezas de carne de res, 1 Cebolla grande, 1 crda Ajo molido,2 crdas Aji amarillo molido, 2 crdas Aji especial molido (panca), 1/2 tz Culantro molido, 1 crdita Comino, Sal al gusto, 1/2 crdita Pimienta, 120 g Zapallo loche rallado, Pimienta, Aceite"),
        FoodModel(nameFood: "Ají de gallina", descriptionFood: "Esto es un ajì de gallina", recommendation: true, category:"Plato principal", score:4.2, foodFavorite: false,ingredients:"1 kg Gallina, 1 kion, 6 ramitas apio, 5 Papa amarilla, 1 Sazonador de gallina, Orégano, 5 Huevos, 200 g Fideos, 1 atado Cebolla china, Canchita tostada"),
        FoodModel(nameFood: "Arroz chaufa", descriptionFood: "Esto es un arroz chaufa", recommendation: true, category:"Plato principal", score:4.3, foodFavorite: true, ingredients: "250 g Chancaca, 1 tz Agua, 1/4 kg Azúcar rubia, 2 ramitas de canela, 1 tz Jugo de naranja, 2 hojas de higos, 5 clavo de olor, 750 g Camote, 1 kg Zapallo, 2 cucharaditas de anís, 60 g Azúcar rubia, 10 g Levadura seca, 650 g Harina sin preparar, 1 tz agua, 1 cda de sal, Aceite"),
        FoodModel(nameFood: "Caldo de gallina", descriptionFood: "Esto es un caldo de gallina", recommendation: true, category:"Entrada", score:4.0, foodFavorite: false,ingredients: "4 piezas de carne de res, 1 Cebolla grande, 1 crda Ajo molido,2 crdas Aji amarillo molido, 2 crdas Aji especial molido (panca), 1/2 tz Culantro molido, 1 crdita Comino, Sal al gusto, 1/2 crdita Pimienta, 120 g Zapallo loche rallado, Pimienta, Aceite"),
        FoodModel(nameFood: "Rocoto Relleno", descriptionFood: "Esto es un rocoto relleno", recommendation: true, category:"Entrada", score:4.3, foodFavorite: false, ingredients:"1 kg Gallina, 1 kion, 6 ramitas apio, 5 Papa amarilla, 1 Sazonador de gallina, Orégano, 5 Huevos, 200 g Fideos, 1 atado Cebolla china, Canchita tostada"),
        FoodModel(nameFood: "Arroz con leche", descriptionFood: "Esto es un arroz con leche", recommendation: true, category:"Postre", score:4.3, foodFavorite: false,ingredients:"1 kg Gallina, 1 kion, 6 ramitas apio, 5 Papa amarilla, 1 Sazonador de gallina, Orégano, 5 Huevos, 200 g Fideos, 1 atado Cebolla china, Canchita tostada"),
        FoodModel(nameFood: "Picarones", descriptionFood: "Esto son picarones", recommendation: true, category:"Postre", score:4.3, foodFavorite: false, ingredients: "250 g Chancaca, 1 tz Agua, 1/4 kg Azúcar rubia, 2 ramitas de canela, 1 tz Jugo de naranja, 2 hojas de higos, 5 clavo de olor, 750 g Camote, 1 kg Zapallo, 2 cucharaditas de anís, 60 g Azúcar rubia, 10 g Levadura seca, 650 g Harina sin preparar, 1 tz agua, 1 cda de sal, Aceite"),
        FoodModel(nameFood: "Menestron", descriptionFood: "Esto es un menestron", recommendation: true, category:"Sopa", score:4.3, foodFavorite: false, ingredients: "250 g Chancaca, 1 tz Agua, 1/4 kg Azúcar rubia, 2 ramitas de canela, 1 tz Jugo de naranja, 2 hojas de higos, 5 clavo de olor, 750 g Camote, 1 kg Zapallo, 2 cucharaditas de anís, 60 g Azúcar rubia, 10 g Levadura seca, 650 g Harina sin preparar, 1 tz agua, 1 cda de sal, Aceite")
    ]
    var foodArrayFiltered = [FoodModel]()
    var searchingFood = false
    @IBOutlet private weak var searchFoodTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    func configureTableViewCell(){
        tableView.rowHeight = 150
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFoodTextField.addTarget(self, action:#selector(searchTextField), for: .editingChanged)
        tableView.dataSource = self
        tableView.delegate = self
    }
    @objc func searchTextField(sender: UITextField){
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
    }
}

extension ListFoodViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countFood = searchingFood ? foodArrayFiltered.count : arrayFood.count
        return countFood
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellFood", for: indexPath) as? FoodTableViewCell{
            let valueFood = searchingFood ? foodArrayFiltered[indexPath.row] : arrayFood[indexPath.row]
            cell.setupViewCell(food: valueFood)
            configureTableViewCell()
            return cell
        }else{
           return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let modalFoodDetails = storyboard?.instantiateViewController(withIdentifier: "ModalFoodDetailsViewController") as? ModalFoodDetailsViewController else { return }
        let sendValueModal = searchingFood ? foodArrayFiltered[indexPath.row] : arrayFood[indexPath.row]
        modalFoodDetails.receivedFood = sendValueModal
        present(modalFoodDetails, animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        searchFoodTextField.resignFirstResponder()
        return true
    }
}

