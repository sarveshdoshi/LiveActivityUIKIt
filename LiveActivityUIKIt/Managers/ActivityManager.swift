//
//  ActivityManager.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 08/04/25.
//

import Foundation
import ActivityKit

class ActivityManager: ObservableObject {
    
    static let shared = ActivityManager()
    
    private init() {}
    
    private var currentActivity: Activity<LiveMatchScoreAttributes>? = nil
    
    func getPushToStartToken() {
        Task {
            if #available(iOS 17.2, *) {
                for await data in Activity<LiveMatchScoreAttributes>.pushToStartTokenUpdates {
                    let token = data.map {String(format: "%02x", $0)}.joined()
                    print("Activity PushToStart Token: \(token)")
                    //send this token to your notification server
                }
            }
        }
    }
    
    func startNewActivity() {
        
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("You can't start live activity.")
            return
        }
        
        do {
            let attribute = LiveMatchScoreAttributes()
            let state = LiveMatchScoreAttributes.ContentState(
                headerText: "",
                homeTeamName: "",
                homeScore: "",
                homeWicketCount: "",
                homeOverCount: "",
                awayTeamName: "",
                awayScore: "",
                awayWicketCount: "",
                awayOverCount: "",
                summaryText: "",
                innings: 0
            )
            
            let activity = try Activity<LiveMatchScoreAttributes>.request(
                attributes: attribute,
                content: .init(state: state , staleDate: nil),
                pushType: .token
            )
            
            self.currentActivity = activity
            
            // This will always return nil as the process for getting the token is asynchronous so we need to await until we get the new token.
//            let token = activity.pushToken
            
            Task {
                for await pushToken in activity.pushTokenUpdates {
                    let pushTokenString = pushToken.reduce("") {
                        $0 + String(format: "%02x", $1)
                    }
                    print("Activity:\(activity.id) push token: \(pushTokenString)")
                    //send this token to your notification server
                }
            }
            
        } catch {
            print("Starting Activity failed with error: \(error)")
            // Handle your errors here how you need to manage.
        }
    }
    
    func updateActivity() {
        Task {
            guard let activity = currentActivity else {
                return
            }
            
            let state: LiveMatchScoreAttributes.ContentState = LiveMatchScoreAttributes.ContentState(
                headerText: "",
                homeTeamName: "",
                homeScore: "",
                homeWicketCount: "",
                homeOverCount: "",
                awayTeamName: "",
                awayScore: "",
                awayWicketCount: "",
                awayOverCount: "",
                summaryText: "",
                innings: 0
            )
            
            await activity.update(
                ActivityContent(state: state, staleDate: nil)
            )
            
        }
    }
    
    func endActivity() {
        Task {
            guard let activity = currentActivity else {
                return
            }
            
            let state: LiveMatchScoreAttributes.ContentState = LiveMatchScoreAttributes.ContentState(
                headerText: "",
                homeTeamName: "",
                homeScore: "",
                homeWicketCount: "",
                homeOverCount: "",
                awayTeamName: "",
                awayScore: "",
                awayWicketCount: "",
                awayOverCount: "",
                summaryText: "",
                innings: 0
            )
            
            await activity.end(
                ActivityContent(state: state, staleDate: nil),
                dismissalPolicy: .immediate
            )
        }
    }
}
