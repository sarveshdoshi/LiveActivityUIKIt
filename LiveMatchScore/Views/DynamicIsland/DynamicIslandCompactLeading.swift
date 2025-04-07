//
//  DynamicIslandCompactLeading.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 08/04/25.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct DynamicIslandCompactLeading: View {
    
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        HStack {
            Image(context.state.homeTeamName)
                .resizable()
                .frame(width: 32,height: 32)
            Text(context.state.homeTeamName)
        }
        .font(.custom(type: .HNMedium, size: 12))
    }
}
