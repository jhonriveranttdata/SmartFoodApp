//
//  DateFoodViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit
import UserNotifications
class DateFoodViewController: UIViewController {
    var presenter: DateFoodPresenterProtocol?
    
    @Published var notificationArray = [UNNotificationRequest]()
    @IBOutlet private weak var foodDatePicker: UIDatePicker!
    @IBOutlet weak var dateNotiFood: UIDatePicker!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBAction private func registerButton(_ sender: Any) {
        presenter?.createNotification(date: dateNotiFood)
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.text = presenter?.arrayFood.dato
    }
}

