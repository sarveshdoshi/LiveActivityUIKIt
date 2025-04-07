//
//  DynamicIslandCompactTrailing.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 08/04/25.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct DynamicIslandCompactTrailing: View {
    
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        HStack {
            Text(context.state.awayTeamName)
            Image(context.state.awayTeamName)
                .resizable()
                .frame(width: 32,height: 32)
        }
        .font(.custom(type: .HNMedium, size: 12))
    }
}
