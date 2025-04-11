//
//  BottomView.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 07/04/25.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct BottomView: View {
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        Text(context.state.summaryText)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .font(.custom(type: .HNMedium, size: 12))
            .foregroundStyle(.windowBackground)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 10)
            .background(Color.green)
    }
}
