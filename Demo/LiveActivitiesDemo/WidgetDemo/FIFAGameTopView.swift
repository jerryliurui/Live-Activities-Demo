//
//  FIFAGameTopView.swift
//  LiveActivitiesDemo
//
//  Created by JerryLiu on 2022/8/18.
//

import SwiftUI
import WidgetKit

struct FIFAGameTopView: View {
    @State var attribute: FIFAActivityAttributes
    @State var state: FIFAActivityAttributes.ContentState
    
    var body: some View {
        HStack {
            FIFATeamView(team: attribute.home)
            
            Spacer()
            
            HStack(spacing: 8.0) {
                Spacer(minLength: 20)
                Text("\(state.homeScore)")
                    .font(.largeTitle)
                    .multilineTextAlignment(.trailing)
                VStack(alignment: .center) {
                    Text(state.halfInfo)
                    Text(state.estimatedEndTime, style: .timer)
                        .font(.system(size: 14, weight: .medium))
                        .multilineTextAlignment(.center)
                }
                Text("\(state.guestScore)")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                Spacer(minLength: 20)
            }
            
            
            Spacer()
            
            FIFATeamView(team: attribute.guest)
        }
    }
}

struct FIFAGameTopView_Previews: PreviewProvider {
    static var previews: some View {
        let homeTeam = FIFATeam(teamName: "Spain", teamLogo: Data(), teamId: "spain", flag: "spain")
        let guestTeam = FIFATeam(teamName: "France", teamLogo: Data(), teamId: "france", flag: "france")
        let attribute = FIFAActivityAttributes(buildId: "0001", gameInfo: "小组赛第三轮，强强对话", gameTitle: "世界杯F组", home:homeTeam, guest: guestTeam)
        
        let startState = FIFAActivityAttributes.ContentState(estimatedEndTime: Date().addingTimeInterval(90 * 60), homeScore: 0, guestScore: 0, halfInfo: "上半场")
        FIFAGameTopView(attribute: attribute, state: startState)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
