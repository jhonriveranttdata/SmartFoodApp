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
        if let str = presenter?.preparation.imgName  {
            imagePreparation.image = UIImage(named: str)
        }

        nombreLabel.text = presenter?.preparation.nombre
        textViewPreparation.text = presenter?.preparation.preparacion
    }
    

}
