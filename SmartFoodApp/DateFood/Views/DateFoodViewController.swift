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
        getValuesDatePicker(date: dateNotiFood)
        createNotification(date: dateNotiFood)
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.text = presenter?.arrayFood.dato
        foodDatePicker.preferredDatePickerStyle = .inline
    }
}

func notificacionSettingsContent() -> UNMutableNotificationContent{
    let content = UNMutableNotificationContent()
    content.title = "¡Hola! Llegó el momento de iniciar"
    content.body = "Tienes planeado preparar Nombre del plato"
    content.sound = .default
    content.badge = 0
    return content
}

func createNotification(date :UIDatePicker){
    let notificationFood = UNUserNotificationCenter.current()
    notificationFood.getNotificationSettings{ settings in
        guard (settings.authorizationStatus == .authorized) || (settings.authorizationStatus == .provisional) else { return }
        DispatchQueue.main.async {
            let components = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date.date)
            let id = components.minute
            if settings.alertSetting == .enabled {
                let content = notificacionSettingsContent()
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                let request = UNNotificationRequest(identifier: "es un \(String(describing: id))", content: content, trigger: trigger)
                notificationFood.add(request){ (error) in
                    print("Error \(error?.localizedDescription ?? "")")
                }
            } else {
                notificationFood.requestAuthorization(options: [.alert, .sound, .badge]) { (allowed, error ) in
                    allowed == true ? print("Permision Granted") : print("Error Occured or Permision Not Granted")
                }
                let content = notificacionSettingsContent()
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                let request = UNNotificationRequest(identifier: "es un \(String(describing: id))", content: content, trigger: trigger)
                notificationFood.add(request){ (error) in
                    print("Error \(error?.localizedDescription ?? "")")
                }
            }
        }
    }
}

let arrayDateFood :[DateFood] = []
func getValuesDatePicker(date :UIDatePicker){
    let calendar = Calendar.current
    let components = calendar.dateComponents([.day, .month, .year, .hour, .minute], from: date.date)
    if let day = components.day, let month = components.month, let year = components.year,
        let hours = components.hour, let minutes = components.minute{
        let dayString = String(day)
        let monthString = String(month)
        let yearString = String(year)
        let hour = String(hours)
        let minutes = String(minutes)
        print(dayString)
        print(monthString)
        print(yearString)
        print(hour)
        print(minutes)
    }
}
/*
extension DateFoodViewController: SendDetailsFoodToDateDelegate{
    func SendDetailsFoodToDate(didDescription description: String) {
        descriptionTextView.text = description
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination =  storyboard?.instantiateViewController(withIdentifier: "ModalFoodDetailsViewController") as?
        ModalFoodDetailsViewController
        destination?.delegate = self
    }
}*/
