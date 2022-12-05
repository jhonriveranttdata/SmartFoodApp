//
//  DateFoodViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit

class DateFoodViewController: UIViewController {

    
    @IBOutlet weak var foodDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodDatePicker.preferredDatePickerStyle = .inline
        // Do any additional setup after loading the view.
    }
    

}
