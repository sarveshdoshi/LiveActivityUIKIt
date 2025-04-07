//
//  DynamicIslandTrailing.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 08/04/25.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct DynamicIslandTrailing: View {
    
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        Text(Date.now.formatted(date: .omitted, time: .shortened))
            .foregroundStyle(.primary)
            .frame(height: 14)
            .lineLimit(1)
            .font(.custom(type: .HN, size: 12))
            .padding(.horizontal)
    }
}
