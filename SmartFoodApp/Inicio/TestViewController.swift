//
//  TestViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 13/12/22.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didButtonTap(_ sender: UIButton) {
        let listaModulo = HomeConfgurator.makeHome()
        self.navigationController?.pushViewController(listaModulo, animated: true)
    }
}
