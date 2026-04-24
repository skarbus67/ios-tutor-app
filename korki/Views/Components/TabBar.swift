//
//  TabBar.swift
//  korki
//
//  Created by Mikołaj Skarbek on 24/04/2026.
//

import SwiftUI


enum Tab {
    case students
    case statistics
    case settings
}

struct TabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack{
            Spacer()
            tabButton(tab: .students, icon: "person.fill" , text: "students")
            Spacer()
            tabButton(tab: .statistics, icon: "chart.bar.fill" , text: "statistics")
            Spacer()
            tabButton(tab: .settings, icon: "gear" , text: "settings")
            Spacer()
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
        .background(Color(white: 0.18))
        .cornerRadius(40)
    }
    
    private func tabButton(tab : Tab, icon : String, text : String) -> some View {
        Button(action: {selectedTab = tab}){
            VStack{
                Image(systemName: icon)
                Text(text)
            }
        }
        .buttonStyle(TabButtonStyle(isCurrent : selectedTab == tab))
    }
}


struct TabButtonStyle: ButtonStyle {
    var isCurrent : Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.top, 10)
            .padding(.bottom, 10)
            .padding(.horizontal, 25)
            .foregroundColor(isCurrent ? .white : .secondary)
            .background(isCurrent ? Color(white: 0.28) : Color.clear)
            .cornerRadius(40)
    }
}

#Preview {
    @Previewable @State var selectedtab: Tab = .students
    TabBar(selectedTab: $selectedtab)
    
}
