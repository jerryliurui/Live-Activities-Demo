//
//  FIFATeam.swift
//  LiveActivitiesDemo
//
//  Created by JerryLiu on 2022/8/12.
//

import Foundation

public class FIFATeam : Codable, Hashable {
    public static func == (lhs: FIFATeam, rhs: FIFATeam) -> Bool {
        return lhs.teamId == rhs.teamId
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(teamId)
        hasher.combine(teamLogo)
        hasher.combine(teamName)
        hasher.combine(flag)
    }
    
    public var teamName: String = ""
    public var teamLogo: Data
    public var teamId: String = ""
    public var flag: String = ""
    
    init(teamName: String, teamLogo: Data, teamId: String, flag: String) {
        self.teamName = teamName
        self.teamLogo = teamLogo
        self.teamId = teamId
        self.flag = flag
    }
}
