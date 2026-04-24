//
//  MainTabView.swift
//  korki
//
//  Created by Mikołaj Skarbek on 22/04/2026.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .settings
    
    var body: some View {
        
        VStack{
            if(selectedTab == .students){
                StudentsView()
            }
            Spacer()
            TabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainTabView()
}
