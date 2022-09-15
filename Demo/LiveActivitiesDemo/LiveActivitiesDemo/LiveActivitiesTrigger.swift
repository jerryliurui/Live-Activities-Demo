//
//  LiveActivitiesTrigger.swift
//  LiveActivitiesDemo
//
//  Created by JerryLiu on 2022/8/12.
//

import Foundation
import ActivityKit

@available(iOSApplicationExtension 16.1, *)
public class LiveActivitiesTrigger {
    
    //我们可以开启多个Live 比如每一场比赛都是一个Live实例 可以通过ID来对应保存一个比赛ID
    //本demo只保存一个实例
    var statusActivity: Activity<FIFAActivityAttributes>?
    
    public func startLiveActivities() -> Void {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("当前设备不可用Live Activities，用户关闭或者设备无法使用")
            return
        }
        
        //模拟用户选择了西班牙VS法国的小组赛(纯属demo哈)
        let homeTeam = FIFATeam(teamName: "Spain", teamLogo: Data(), teamId: "spain", flag: "spain")
        let guestTeam = FIFATeam(teamName: "France", teamLogo: Data(), teamId: "france", flag: "france")
        let attribute = FIFAActivityAttributes(buildId: "0001", gameInfo: "小组赛第三轮，强强对话", gameTitle: "世界杯F组",home: homeTeam, guest: guestTeam)
        
        let startState = FIFAActivityAttributes.ContentState(estimatedEndTime: Date().addingTimeInterval(90 * 60), homeScore: 0, guestScore: 0, halfInfo: "上半场")
        
        do {
            self.statusActivity = try Activity<FIFAActivityAttributes>.request(attributes: attribute, contentState: startState, pushType: nil)
            print("开启Live Activities 成功 \(String(describing: self.statusActivity?.id))")
        } catch let e {
            print("开启Live Activities 失败，原因:\(e.localizedDescription)")
        }
    }
    
    public func startPushLiveActivities() -> Void {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("当前设备不可用Live Activities，用户关闭或者设备无法使用")
            return
        }
        
        let homeTeam = FIFATeam(teamName: "germany", teamLogo: Data(), teamId: "germany", flag: "germany")
        let guestTeam = FIFATeam(teamName: "japan", teamLogo: Data(), teamId: "japan", flag: "japan")
        let attribute = FIFAActivityAttributes(buildId: "0001", gameInfo: "小组赛第一轮，强强对话", gameTitle: "世界杯揭幕战", home: homeTeam, guest: guestTeam)
        
        let startState = FIFAActivityAttributes.ContentState(estimatedEndTime: Date().addingTimeInterval(90 * 60), homeScore: 0, guestScore: 0, halfInfo: "上半场")
        
        do {
            self.statusActivity = try Activity<FIFAActivityAttributes>.request(attributes: attribute, contentState: startState, pushType: .token)
            
            print(self.statusActivity?.pushToken as Any)
            
            let pushTokenString = String(deviceToken: self.statusActivity?.pushToken ?? Data())
                    
            print("推送LiveActivities Token:\(String(describing: pushTokenString))")
            
            //开启监听
            let _ = self.listenForPushTokenChanged(activities: self.statusActivity)
            
        } catch let e {
            print("开启Live Activities 失败，原因:\(e.localizedDescription)")
        }
    }
    
    func listenForPushTokenChanged(activities:Activity<FIFAActivityAttributes>?) -> Task<Void, Error>? {
        guard let activities = activities else { return nil }
        
        return Task.detached {
            for await tokenData in activities.pushTokenUpdates {
                let pushTokenString = String(deviceToken: tokenData)
                print("\(activities.id)新Token:\(String(describing: pushTokenString))")
                
                //发送这个ID和Token给后台服务器
            }
        }
    }
    
    public func updateCurrentLiveActivities() -> Void {
        Task {
            let updateState = FIFAActivityAttributes.ContentState(estimatedEndTime: Date().addingTimeInterval(80 * 60), homeScore: 1, guestScore: 0, halfInfo: "上半场")
            
            await self.statusActivity?.update(using: updateState)
            
            print("更新Live Activities 成功 \(String(describing: self.statusActivity?.id))")
        }
    }
    
    public func updateCurrentLiveActivities2() -> Void {
        Task {
            let updateState = FIFAActivityAttributes.ContentState(estimatedEndTime: Date().addingTimeInterval(20 * 60), homeScore: 3, guestScore: 0, halfInfo: "下半场")
            
            await self.statusActivity?.update(using: updateState)
        }
    }
    
    public func updateCurrentLiveActivities3() -> Void {
        Task {
            let updateState = FIFAActivityAttributes.ContentState(estimatedEndTime: Date().addingTimeInterval(20 * 60), homeScore: 4, guestScore: 5, halfInfo: "下半场")
            
            await self.statusActivity?.update(using: updateState)
        }
    }
    
    public func endLiveActivities() -> Void {
        Task {
            let endState = FIFAActivityAttributes.ContentState(estimatedEndTime: Date(), homeScore: 4, guestScore: 6, halfInfo: "全场结束")
            
            await self.statusActivity?.end(using: endState,dismissalPolicy: .default)//+4h
            //await self.statusActivity?.end(using: endState,dismissalPolicy: .immediate)//立刻结束
            //await self.statusActivity?.end(using: endState,dismissalPolicy: .after(Date().addingTimeInterval(60 * 60)))//一小时之后结束
        }
    }
    
}
