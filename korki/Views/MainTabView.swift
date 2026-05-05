//
//  MainTabView.swift
//  korki
//
//  Created by Mikołaj Skarbek on 22/04/2026.
//

import SwiftUI
import SwiftData

struct MainTabView: View {
    @State private var selectedTab: Tab = .students
    
    var body: some View {
        
        VStack{
            if(selectedTab == .students){
                StudentsView()
            }
            else if(selectedTab == .statistics){
                StatisticsView()
            }
            else if(selectedTab == .settings){
                SettingsView()
            }
            Spacer()
            TabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainTabView()
        .modelContainer(for: [Student.self, Lesson.self])
}
