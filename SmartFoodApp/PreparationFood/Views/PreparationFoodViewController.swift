//
//  PreparationFoodViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 15/12/22.
//

import UIKit

class PreparationFoodViewController: UIViewController {

    @IBOutlet weak var imagePreparation: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var textViewPreparation: UITextView!
    var presenter: PreparationFoodPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let str = presenter?.preparation.imgName
        let url = URL(string: str!)
        if let data = try? Data(contentsOf: url!){
            imagePreparation.image = UIImage(data: data)
        }
        nombreLabel.text = presenter?.preparation.nombre
        textViewPreparation.text = presenter?.preparation.preparacion
        // Do any additional setup after loading the view.
    }


}
