//
//  HeaderView.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 07/04/25.
//
import SwiftUI
import ActivityKit
import WidgetKit

struct HeaderView: View {
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        HStack {
            Text(context.state.headerText)
            Spacer()
            Text(Date.now.formatted(date: .numeric, time: .shortened))
        }
        .foregroundStyle(.primary)
        .frame(height: 14)
        .lineLimit(1)
        .font(.custom(type: .HN, size: 12))
        .padding(.horizontal)
    }
}
