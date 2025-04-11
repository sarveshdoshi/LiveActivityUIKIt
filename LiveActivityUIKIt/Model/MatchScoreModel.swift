//
//  MatchScoreModel.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 08/04/25.
//

import Foundation

struct MatchScoreModel: Codable {
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
