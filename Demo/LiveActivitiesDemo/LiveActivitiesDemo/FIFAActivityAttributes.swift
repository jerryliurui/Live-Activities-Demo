//
//  FIFAActivityAttributes.swift
//  LiveActivitiesDemo
//
//  Created by JerryLiu on 2022/8/12.
//

import SwiftUI
import WidgetKit
import ActivityKit

struct FIFAActivityAttributes: ActivityAttributes {
    public typealias FIFAGameStatus = ContentState
  
    public struct ContentState: Codable, Hashable {
        var estimatedEndTime: Date
        var homeScore: Int
        var guestScore: Int
        var halfInfo:String
    }
  
    var buildId: String
    var gameInfo: String
    var gameTitle: String
    var home: FIFATeam
    var guest: FIFATeam
}
