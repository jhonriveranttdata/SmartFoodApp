//
//  HomeViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 12/12/22.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: Propiedades
    var presenter : HomePresenterProtocol?
    
    //MARK: Métodos
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
}

extension HomeViewController : HomeViewProtocol{
    
}
