//
//  ContentView.swift
//  LiveActivitiesDemo
//
//  Created by JerryLiu on 2022/8/11.
//

import SwiftUI

struct ContentView: View {
    
    let gameTrigger: LiveActivitiesTrigger = LiveActivitiesTrigger()
    
    var body: some View {
        VStack(alignment: .center, spacing: 18.0) {
            Image("world_cup_2022_logo")
                .resizable()
                .padding([.top, .leading, .trailing])
                .frame(height: 200)
            
            Text("Live Activities Demo")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 1.0, saturation: 0.723, brightness: 0.212))
                .multilineTextAlignment(.center)
                .padding(.top, 20.0)
            
            
            HStack(spacing: 20.0) {
                Image("spain")
                
                Text("VS")
                
                Image("france")
            }
            .padding(.top, 12.0)
            
            Text("端内Start+Update+End")
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(Color(hue: 1.0, saturation: 0.723, brightness: 0.212))
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding(.top, 10.0)
            
            Button {
              DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 2,
                            execute: {
                    gameTrigger.startLiveActivities()
                })
              
            } label: {
              Text("开始比赛-激活锁屏Live")
                .font(.system(size: 18, weight: .medium))
            }
            
            Button {
              DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 2,
                            execute: {
                    gameTrigger.updateCurrentLiveActivities()
                })
              
            } label: {
              Text("西班牙得分")
                .font(.system(size: 18, weight: .medium))
            }
            
            Button {
              DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 2,
                            execute: {
                    gameTrigger.updateCurrentLiveActivities2()
                })
              
            } label: {
              Text("开始下半场")
                .font(.system(size: 18, weight: .medium))
            }
            
            Button {
              DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 2,
                            execute: {
                    gameTrigger.endLiveActivities()
                })
              
            } label: {
              Text("结束比赛~！")
                .font(.system(size: 18, weight: .medium))
            }
            
            Text("通过Push Start Live")
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(Color(hue: 1.0, saturation: 0.723, brightness: 0.212))
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .padding(.top, 10.0)
            
            Button {
              DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 2,
                            execute: {
                    gameTrigger.startPushLiveActivities()
                })
              
            } label: {
              Text("开始Push推送激活LiveActivities")
                    .font(.system(size: 18, weight: .medium))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
