//
//  LiveMatchScoreAttributes.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 06/04/25.
//

import ActivityKit
import WidgetKit
import SwiftUI


struct LiveMatchScoreAttributes: ActivityAttributes {
    
    public struct ContentState: Codable, Hashable {
        var homeTeamName: String
        var awayTeamName: String
        var homeScore: String
        var homeWicketCount: String
        var homeOverCount: String
        var awayScore: String
        var awayWicketCount: String
        var awayOverCount: String
        var headerText: String
        var summaryText: String
        var innings: Int
    }
    
}
