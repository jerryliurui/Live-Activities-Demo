//
//  UploadLiveActivitiesWidget.swift
//  LiveActivitiesDemo
//
//  Created by JerryLiu on 2022/8/11.
//

import Foundation

import WidgetKit
import SwiftUI
import Intents

struct UploadLiveActivitiesWidget: Widget {
    let kind: String = "UploadLiveActivitiesWidget"
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FIFAActivityAttributes.self) { context in
            // Create the view that appears on the Lock Screen and as a
            // banner on the Home Screen of devices that don't support the
            // Dynamic Island.
            // ...
            FIFAGameView(attribute: context.attributes, state: context.state)
            
        } dynamicIsland: { context in
            // Create the views that appear in the Dynamic Island.
            // ...
            // Expand when user long press Island
            // 灵动岛会切割成四个部位，左 中 右 底
            
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    FIFATeamView(team: context.attributes.home)
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    FIFATeamView(team: context.attributes.guest)
                }
                
                DynamicIslandExpandedRegion(.center) {
                    DynamicIslandExpandCenterView(context: context)
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    DynamicIslandExpandBottomView(context: context)
                }
            } compactLeading: {
                //当灵动岛只有我们的App时，展示在左部的UI
                HStack {
                    Image(context.attributes.home.flag)
                        .foregroundColor(.indigo)
                    Text("\(context.state.homeScore)")
                        .foregroundColor(.indigo)
                        .font(.title2)
                        .multilineTextAlignment(.trailing)
                }
            } compactTrailing: {
                //当灵动岛只有我们的App时，展示在右部的UI
                HStack {
                    Text("\(context.state.guestScore)")
                        .foregroundColor(.indigo)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                    Image(context.attributes.guest.flag)
                        .foregroundColor(.indigo)
                }
            } minimal: {
                //多App 在灵动岛上时 展示的View
                ZStack {
                    Image(context.attributes.home.flag)
                    Image(context.attributes.guest.flag)
                        .padding(.leading, 12.0)
                }
            }
        }
    }
    
    
    @ViewBuilder
    func DynamicIslandExpandCenterView(context: ActivityViewContext<FIFAActivityAttributes>) -> some View {
        HStack(spacing: 8.0) {
            Spacer(minLength: 20)
            Text("\(context.state.homeScore)")
                .foregroundColor(.indigo)
                .font(.title2)
                .multilineTextAlignment(.trailing)
            VStack(alignment: .center) {
                Text(context.state.halfInfo)
                Text(context.state.estimatedEndTime, style: .timer)
                    .foregroundColor(.indigo)
                    .font(.title2)
                    .multilineTextAlignment(.center)
            }
            Text("\(context.state.guestScore)")
                .foregroundColor(.indigo)
                .font(.title2)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 20)
        }
    }
    
    @ViewBuilder
    func DynamicIslandExpandBottomView(context: ActivityViewContext<FIFAActivityAttributes>) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(context.attributes.gameTitle)
                Text(context.attributes.gameInfo)
            }
            Spacer()
            
            Image("news")
                .resizable()
                .frame(width: 25, height: 25)
        }
    }
}
