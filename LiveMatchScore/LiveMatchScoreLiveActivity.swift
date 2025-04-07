//
//  LiveMatchScoreLiveActivity.swift
//  LiveMatchScore
//
//  Created by Sarvesh Doshi on 06/04/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveMatchScoreLiveActivity: Widget {
    var body: some WidgetConfiguration {
        
        ActivityConfiguration(for: LiveMatchScoreAttributes.self) { context in
            // Lock screen/banner UI
            LockScreenView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI
                
                DynamicIslandExpandedRegion(.leading) {
                   
                }
                DynamicIslandExpandedRegion(.trailing) {
                   
                    
                }
                DynamicIslandExpandedRegion(.bottom) {
                    
                }
            } compactLeading: {
                Text("Auction 2025")
                    .font(.custom(type: .HNMedium, size: 12))
            } compactTrailing: {
                Image("logo")
                    .resizable()
            } minimal: {
                Image("logo")
                    .resizable()
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct AuctionWidgetLiveActivity_Previews: PreviewProvider {
    static let attributes = LiveMatchScoreAttributes(
        headerTitle: "IPL Auction 2025",
        currentDate: "11/11/2024"
    )
    
    static let contentState = LiveMatchScoreAttributes.ContentState(
        homeTeamName: "MI",
        awayTeamName: "RCB",
        homeScore: "120",
        homeWicketCount: "4",
        homeOverCount: "22.0",
        awayScore: "0",
        awayWicketCount: "0",
        awayOverCount: "0"
    )
    
    static var previews: some View {
        // Lock screen/Banner preview
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Lock Screen/Banner")
        
        // Dynamic Island Expanded (leading, trailing, center, and bottom)
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Dynamic Island Expanded")
        
        // Dynamic Island Compact Leading
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Dynamic Island Compact")
        
        // Dynamic Island Minimal
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Dynamic Island Minimal")
    }
}

