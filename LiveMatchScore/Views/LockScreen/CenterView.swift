//
//  CenterView.swift
//  LiveActivityUIKIt
//
//  Created by Sarvesh Doshi on 07/04/25.
//
import SwiftUI
import ActivityKit
import WidgetKit

struct CenterView: View {
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        HStack {
            VStack(spacing: 0){
                Image(context.state.homeTeamName)
                    .resizable()
                    .frame(width: 44,height: 44)
                    
                Text(context.state.homeTeamName)
                    .foregroundStyle(.primary)
                    .font(.custom(type: .HNBold, size: 12))
            }
            
            Spacer()
            
           
            HStack {
                HomeTeamScoreView(context: context)
                Spacer()
                Image("live")
                    .resizable()
                    .frame(width: 48,height: 20)
                Spacer()
                AwayTeamScoreView(context: context)
            }
            
            Spacer()
            
            VStack(spacing: 0){
                Image(context.state.awayTeamName)
                    .resizable()
                    .frame(width: 44,height: 44)
                    
                Text(context.state.awayTeamName)
                    .foregroundStyle(.primary)
                    .font(.custom(type: .HNBold, size: 12))
            }
        }
        .padding(.horizontal)
    }
}
