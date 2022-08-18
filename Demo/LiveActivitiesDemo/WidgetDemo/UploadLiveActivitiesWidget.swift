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
    ActivityConfiguration(attributesType: FIFAActivityAttributes.self) { context in
        FIFAGameView(attribute: context.attributes, state: context.state)
    }
  }
}
