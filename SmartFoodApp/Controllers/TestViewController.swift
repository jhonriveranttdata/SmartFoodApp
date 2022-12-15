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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didButtonTap(_ sender: UIButton) {
        let listaModulo = HomeConfgurator.makeHome()
        self.navigationController?.pushViewController(listaModulo, animated: true)
       //present(listaModulo, animated: true)
        //self.activity.stopAnimating()
        //self.activity.hidesWhenStopped = true
    }
    

}
