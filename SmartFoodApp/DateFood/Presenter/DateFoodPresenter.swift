//
//  DateFoodPresenter.swift
//  SmartFoodApp
//
//  Created by Jhon Bryan Rivera Mino on 14/12/22.
//

import Foundation
import UIKit
import UserNotifications

class DateFoodPresenter{
    private let itemDate: FoodEntity
    @Published var notificationArray = [UNNotificationRequest]()
    required init(itemDate: FoodEntity) {
        self.itemDate = itemDate
    }
}
extension DateFoodPresenter: DateFoodPresenterProtocol{
    var arrayFood: FoodEntity {
        itemDate
    }
    
    //MARK: NOTIFICATION
    func notificacionSettingsContent() -> UNMutableNotificationContent{
        let content = UNMutableNotificationContent()
        content.title = "¡Hola! Llegó el momento de iniciar"
        content.body = "Tienes planeado preparar \(itemDate.nombre)"
        content.sound = .default
        return content
    }
    
    func createNotification(date :UIDatePicker){
        
        let notificationFood = UNUserNotificationCenter.current()
        
        notificationFood.getNotificationSettings{ settings in
            DispatchQueue.main.async {
                let components = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date.date)
                let id = components.minute
                if (settings.authorizationStatus == .authorized) || (settings.authorizationStatus == .provisional) {
                    let content = self.notificacionSettingsContent()
                    let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                    let request = UNNotificationRequest(identifier: "es un \(String(describing: id))", content: content, trigger: trigger)
                    notificationFood.add(request){ (error) in
                        print("Error \(error?.localizedDescription ?? "")")
                    }
                } else {
                    notificationFood.requestAuthorization(options: [.alert, .sound ]) { (allowed, error ) in
                        allowed == true ? print("Permision Granted") : print("Error Occured or Permision Not Granted")
                    }
                    let content = self.notificacionSettingsContent()
                    let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                    let request = UNNotificationRequest(identifier: "es un \(String(describing: id))", content: content, trigger: trigger)
                    notificationFood.add(request){ (error) in
                        print("Error \(error?.localizedDescription ?? "")")
                    }
                }
            }
        }
    }
}

