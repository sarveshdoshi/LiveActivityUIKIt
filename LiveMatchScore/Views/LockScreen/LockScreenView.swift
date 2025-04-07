//
//  LockScreenView.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 06/04/25.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct LockScreenView: View {
    
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        VStack {
            // Top View
            HeaderView(context: context)
            
            //Center View
            CenterView(context: context)
            
            // Bottom View
            BottomView(context: context)
        }
        .padding(.top, 8)
        .background(.windowBackground)
    }
}
