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
                   DynamicIslandLeading(context: context)
                }
                DynamicIslandExpandedRegion(.trailing) {
                   DynamicIslandTrailing(context: context)
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                   DynamicIslandBottom(context: context)
                }
            } compactLeading: {
               DynamicIslandCompactLeading(context: context)
            } compactTrailing: {
               DynamicIslandCompactTrailing(context: context)
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
    static let attributes = LiveMatchScoreAttributes()
    
    static let contentState = LiveMatchScoreAttributes.ContentState(
        headerText: "IPL Match 25",
        homeTeamName: "MI",
        homeScore: "120",
        homeWicketCount: "1",
        homeOverCount: "6",
        awayTeamName: "RCB",
        awayScore: "110",
        awayWicketCount: "9",
        awayOverCount: "15.4",
        summaryText: "MI Won the toss and elected to Bat first",
        innings: 2
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

