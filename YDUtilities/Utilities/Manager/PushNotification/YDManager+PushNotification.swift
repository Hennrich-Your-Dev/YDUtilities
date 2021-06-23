//
//  YDManager+PushNotification.swift
//  YDUtilities
//
//  Created by Douglas Hennrich on 22/06/21.
//

import UIKit
import UserNotifications

public extension YDManager {
  struct Notification {
    public static let notificationCenter = UNUserNotificationCenter.current()

    public static func getNotificationStatus(onCompleted completed: @escaping (Bool) -> Void) {
      YDManager.Notification.notificationCenter.getNotificationSettings { settings in
        completed(settings.authorizationStatus == .authorized)
      }
    }

    public static func requestNotificationPermission(onCompleted completed: @escaping (Bool) -> Void) {
      getNotificationStatus { authorized in
        if !authorized {
          let options: UNAuthorizationOptions = [.alert, .sound, .badge]
          YDManager.Notification.notificationCenter
            .requestAuthorization(options: options) { didAllow, error in
              completed(didAllow)
            }
        } else {
          completed(true)
        }
      }
    }

    public static func registerLocalNotification() {}

    public static func scheduleLocalNotification(date: Date, title: String, message: String) {
      let dateComponents = Calendar.current
        .dateComponents([.month, .day, .hour, .minute], from: date)

      let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
      // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

      let content = UNMutableNotificationContent()
      content.title = title
      content.body = message
      content.sound = .default

      let request = UNNotificationRequest(
        identifier: UUID().uuidString,
        content: content,
        trigger: trigger
      )
      YDManager.Notification.notificationCenter.add(request)
    }
  }
}
