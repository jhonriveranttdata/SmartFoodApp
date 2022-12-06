//
//  DateFoodViewController.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 5/12/22.
//

import UIKit
import UserNotifications
class DateFoodViewController: UIViewController {

    
    @IBOutlet private weak var foodDatePicker: UIDatePicker!
    
    @IBOutlet weak var dateNotiFood: UIDatePicker!
    @IBAction private func registerButton(_ sender: Any) {

        //getValuesDatePicker(date: dateNotiFood)
        createNotification(date: dateNotiFood)
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        foodDatePicker.preferredDatePickerStyle = .inline
    }
}

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
func createNotification(date :UIDatePicker){
    let notiFood = UNUserNotificationCenter.current()
    notiFood.getNotificationSettings{ settings in
        guard (settings.authorizationStatus == .authorized) || (settings.authorizationStatus == .provisional) else { return }
        var countNotitication = 0
        
        if settings.alertSetting == .enabled {

            let components = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date.date)
            
            let content = UNMutableNotificationContent()
            content.title = "Agendaste preparar un plato"
            content.body = "Es hora de iniciar!!"
            content.sound = .default
            countNotitication = countNotitication + 1
            content.badge = countNotitication as NSNumber
            
            //let dateComponents = Calendar.current.dateComponents(Set(arrayLiteral: Calendar.Component.year, Calendar.Component.month, Calendar.Component.day), from: components)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: "1002", content: content, trigger: trigger)
            
            notiFood.add(request){ (error) in
                print("Error \(error?.localizedDescription ?? "")")
            }
        } else {
            notiFood.requestAuthorization(options: [.alert, .sound, .badge]) { (allowed, error ) in
                allowed == true ? print("Permision Granted") : print("Error Occured or Permision Not Granted")
            }
            let components = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date.date)
            
            let content = UNMutableNotificationContent()
            content.title = "Agendaste preparar un plato"
            content.body = "Es hora de iniciar!!"
            content.sound = .default
            countNotitication = countNotitication + 1
            content.badge = countNotitication as NSNumber
            
            //let dateComponents = Calendar.current.dateComponents(Set(arrayLiteral: Calendar.Component.year, Calendar.Component.month, Calendar.Component.day), from: components)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: "1002", content: content, trigger: trigger)
            
            notiFood.add(request){ (error) in
                print("Error \(error?.localizedDescription ?? "")")
            }
        }
    }
}

