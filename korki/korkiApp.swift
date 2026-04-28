//
//  korkiApp.swift
//  korki
//
//  Created by Mikołaj Skarbek on 22/04/2026.
//

import SwiftUI
import SwiftData

@main
struct korkiApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: [Student.self, Lesson.self])
    }
}
