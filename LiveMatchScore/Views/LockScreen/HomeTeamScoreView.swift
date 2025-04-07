//
//  HomeTeamScoreView.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 07/04/25.
//
import SwiftUI
import ActivityKit
import WidgetKit

struct HomeTeamScoreView: View {
    
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        VStack(alignment:.leading, spacing: 2) {
            HStack(spacing: 2) {
                Text(context.state.homeScore)
                Text("-")
                Text(context.state.homeWicketCount)
            }
            .font(.custom(type: .HNBold, size: 22))
            HStack(spacing: 2) {
                Text(context.state.homeOverCount)
                Text("Overs")
            }
            .font(.custom(type: .HNMedium, size: 12))
        }
        .foregroundStyle(.primary)
    }
}
