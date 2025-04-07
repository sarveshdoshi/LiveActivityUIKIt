//
//  DynamicIslandLeading.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 08/04/25.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct DynamicIslandLeading: View {
    
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        Text(context.state.headerText)
            .foregroundStyle(.primary)
            .frame(height: 14)
            .lineLimit(1)
            .font(.custom(type: .HN, size: 12))
            .padding(.horizontal)
    }
}
