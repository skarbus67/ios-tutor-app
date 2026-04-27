//
//  Lesson.swift
//  korki
//
//  Created by Mikołaj Skarbek on 27/04/2026.
//

import Foundation
import SwiftData

@Model
class Lesson{
    @Attribute(.unique) var id: UUID = UUID()
    var lessonStartDate: Date
    var lessonEndDate: Date
    var paymentDate: Date
    var paymentAmount: Int
    var lessonDescription: String
    var isPaid: Bool
    
    var student: Student?
    
    init(lessonStartDate: Date, lessonEndDate: Date, paymentDate: Date, paymentAmount: Int, lessonDescription: String, isPaid: Bool) {
        self.lessonStartDate = lessonStartDate
        self.lessonEndDate = lessonEndDate
        self.paymentDate = paymentDate
        self.paymentAmount = paymentAmount
        self.lessonDescription = lessonDescription
        self.isPaid = isPaid
    }
}
