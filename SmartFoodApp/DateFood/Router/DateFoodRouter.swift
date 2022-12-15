//
//  DateFoodRouter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 14/12/22.
//

import Foundation
import UIKit
class DateFoodRouter{
    var presenter: DateFoodPresenterProtocol?
    var view: UIViewController?
    //var delegate: DateFoodConfiguratorDelegate
    required init(presenter: DateFoodPresenterProtocol) {
        self.presenter = presenter
    }
}

extension DateFoodRouter: DateFoodRouterProtocol{
    func dismiss(){
        view?.dismiss(animated: true)
        //delegate.dateFoodConfigurator(didDismiss: view!)
    }
}
