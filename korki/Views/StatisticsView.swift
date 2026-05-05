//
//  StatisticsView.swift
//  korki
//
//  Created by Mikołaj Skarbek on 28/04/2026.
//

import SwiftUI
import SwiftData

struct StatisticsView: View {
    @Query var lessons: [Lesson]
    
    var body: some View {
        VStack{
            HStack{
                Text("total earnings")
                Spacer()
                Text(String(StatisticsUtils.totalEarnings(lessons: lessons)))
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
            .padding(.horizontal, 30)
            
            .background(Color(white: 0.30))
            .cornerRadius(22)
            .padding(.horizontal, 20)
            
            
            Spacer()
        }
    }
    
    
    
}

#Preview {
    StatisticsView()
        .modelContainer(for: Lesson.self)
}
