//
//  AppDelegate.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 06/04/25.
//

import UIKit
import UserNotifications
import ActivityKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ActivityManager.shared.getPushToStartToken()
        observeActivityPushTokenAndState()
        let authOptions: UNAuthorizationOptions = [.alert,.badge,.sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (granted, error) in
            print(granted,error ?? "")
        }
        application.registerForRemoteNotifications()
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", { $0 + String(format: "%02X", $1) })
        print("APNs device token: \(deviceTokenString)")
    }
}

extension AppDelegate {
    func observeActivityPushTokenAndState() {
        Task {
            for await activity in Activity<LiveMatchScoreAttributes>.activityUpdates {
                Task {
                    for await tokenData in activity.pushTokenUpdates {
                        let token = tokenData.map {String(format: "%02x", $0)}.joined()
                        print("Observer Activity:\(activity.id) Push token: \(token)")
                        
                        //send this token to your notification server
                    }
                }
                
                Task {
                    for await state in activity.activityStateUpdates {
                        print("Observer Activity:\(activity.id) state:\(state)")
                        let stateLog = "Observer Activity:\(activity.id) state:\(state)"
                        if state == .stale {
                            ActivityManager.shared.endActivity()
                        }
                    }
                }
                
            }
        }
    }
}
