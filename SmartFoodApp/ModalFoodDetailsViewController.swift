//
//  ModalFoodDetailsViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class ModalFoodDetailsViewController: UIViewController {

    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var nameFoodLabel: UILabel!
    @IBOutlet weak var categoryFoodLabel: UILabel!
    
    var nameFood:String?
    var categoryFood:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        nameFoodLabel.text = nameFood
        categoryFoodLabel.text = categoryFood
    }
}
