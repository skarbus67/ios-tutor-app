//
//  StatisticsUtils.swift
//  korki
//
//  Created by Mikołaj Skarbek on 05/05/2026.
//

import Foundation
import SwiftData


class StatisticsUtils{
    static func totalEarnings(lessons: [Lesson]) -> Int{
        var total = 0
        for lesson in lessons{
            if(lesson.isPaid){
                total = total + lesson.paymentAmount
            }
        }
        return total
    }
}
