//
//  FIFAGameView.swift
//  LiveActivitiesDemo
//
//  Created by JerryLiu on 2022/8/12.
//

import SwiftUI
import WidgetKit

struct FIFAGameView: View {
    @State var attribute: FIFAActivityAttributes
    @State var state: FIFAActivityAttributes.ContentState
    
    var body: some View {
        VStack {
            FIFAGameTopView(attribute: attribute, state: state)
    
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(attribute.gameTitle)
                    Text(attribute.gameInfo)
                }
                
                Spacer()
                
                Image("news")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
        }
        .padding(.all)
    }
}

struct FIFAGameView_Preview: PreviewProvider {
    static var previews: some View {
        let homeTeam = FIFATeam(teamName: "Spain", teamLogo: Data(), teamId: "spain", flag: "spain")
        let guestTeam = FIFATeam(teamName: "France", teamLogo: Data(), teamId: "france", flag: "france")
        let attribute = FIFAActivityAttributes(buildId: "0001", gameInfo: "小组赛第三轮，强强对话", gameTitle: "世界杯F组", home:homeTeam, guest: guestTeam)
        
        let startState = FIFAActivityAttributes.ContentState(estimatedEndTime: Date().addingTimeInterval(90 * 60), homeScore: 0, guestScore: 0, halfInfo: "上半场")
        FIFAGameView(attribute: attribute, state: startState)
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}


