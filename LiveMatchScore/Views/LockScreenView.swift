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
        .padding(.vertical, 8)
    }
}

struct HeaderView: View {
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        HStack {
            Text(context.attributes.headerTitle)
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
                Image("vs")
                    .resizable()
                    .frame(width: 28,height: 28)
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

struct BottomView: View {
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        Text("BottomView to be shown here.")
    }
}

struct HomeTeamScoreView: View {
    
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        Text("TeamName")
    }
}

struct AwayTeamScoreView: View {
    
    let context: ActivityViewContext<LiveMatchScoreAttributes>
    
    var body: some View {
        Text("TeamName")
    }
}

