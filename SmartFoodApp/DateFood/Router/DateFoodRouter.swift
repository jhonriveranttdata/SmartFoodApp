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
    required init(presenter: DateFoodPresenterProtocol) {
        self.presenter = presenter
    }
}

