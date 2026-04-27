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
    var lessonDate: Date
    var paymentDate: Date
    var paymentAmount: Int
    var lessonDescription: String
    var isPaid: Bool
    
    var student: Student?
    
    init(lessonDate: Date, paymentDate: Date, paymentAmount: Int, lessonDescription: String, isPaid: Bool) {
        self.lessonDate = lessonDate
        self.paymentDate = paymentDate
        self.paymentAmount = paymentAmount
        self.lessonDescription = lessonDescription
        self.isPaid = isPaid
    }
}
