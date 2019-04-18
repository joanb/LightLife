//
//  AppDelegate.swift
//  LightLife
//
//  Created by joan barroso on 30/03/2019.
//  Copyright © 2019 joan barroso. All rights reserved.
//

import UIKit
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let notificationCenter = UNUserNotificationCenter.current()
        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in })
        
        let invitationCategory = UNNotificationCategory(identifier: "INVITATION", actions: [], intentIdentifiers: [], options: UNNotificationCategoryOptions(rawValue: 0))
        center.setNotificationCategories([invitationCategory])

        return true
    }
}
