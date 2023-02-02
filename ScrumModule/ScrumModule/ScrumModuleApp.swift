//
//  ScrumModuleApp.swift
//  ScrumModule
//
//  Created by 이수민 on 2023/01/29.
//

import SwiftUI

@main
struct ScrumModuleApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
