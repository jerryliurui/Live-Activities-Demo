//
//  FIFATeamView.swift
//  LiveActivitiesDemo
//
//  Created by JerryLiu on 2022/8/12.
//

import SwiftUI
import WidgetKit

struct FIFATeamView: View {
    @State var team: FIFATeam
    
    var body: some View {
        VStack(alignment: .center, spacing: 6.0) {
            Image(team.flag)
                .resizable()
                .frame(width: 40, height: 40)
            Text(team.teamName)
                .font(.footnote)
                .foregroundColor(Color.cyan)
        }
    }
}

struct FIFATeamView_Previews: PreviewProvider {
    static var previews: some View {
        FIFATeamView(team: FIFATeam(teamName: "Spain", teamLogo: Data(), teamId: "Spain", flag: "spain"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
