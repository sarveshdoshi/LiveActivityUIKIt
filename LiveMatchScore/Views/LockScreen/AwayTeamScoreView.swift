//
//  AwayTeamScoreView.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 07/04/25.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct AwayTeamScoreView: View {
    
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        VStack(alignment:.trailing, spacing: 2) {
            HStack(spacing: 2) {
                Text(context.state.awayScore)
                Text("-")
                Text(context.state.awayWicketCount)
            }
            .font(.custom(type: .HNBold, size: 22))
            HStack(spacing: 2) {
                Text(context.state.awayOverCount)
                Text("Overs")
            }
            .font(.custom(type: .HNMedium, size: 12))
        }
        .foregroundStyle(.primary)
    }
}
