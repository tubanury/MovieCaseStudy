//
//  NotificationManager.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 14.10.2022.
//

import Foundation
import FirebaseMessaging

class NotificationManager {
    
    public static let shared = NotificationManager()
    var fcmRegTokenMessage: String?
    
    //use this method at any time to access the token instead of storing it.
    func fetchCurrentToken(){
        Messaging.messaging().token { token, error in
          if let error = error {
            print("Error fetching FCM registration token: \(error)")
          } else if let token = token {
            print("FCM registration token: \(token)")
            self.fcmRegTokenMessage = "Remote FCM registration token: \(token)"
          }
        }
    }
    
    
    
    
}
