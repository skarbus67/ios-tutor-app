//
//  LessonViewModel.swift
//  korki
//
//  Created by Mikołaj Skarbek on 27/04/2026.
//

import Foundation
import SwiftData

@Observable
class LessonViewModel{
    var lessonStartDate: Date = .now
    var lessonEndDate: Date = .now.advanced(by: 3600)
    var paymentDate: Date? = nil
    var paymentAmount: Int? = nil
    var lessonDescription: String = ""
    var isPaid: Bool = false
    
    init() {}
        
    init(lesson: Lesson) {
        self.lessonStartDate = lesson.lessonStartDate
        self.lessonEndDate = lesson.lessonEndDate
        self.paymentDate = lesson.paymentDate
        self.paymentAmount = lesson.paymentAmount
        self.lessonDescription = lesson.lessonDescription
        self.isPaid = lesson.isPaid
    }
        
    func update(lesson: Lesson) {
        lesson.lessonStartDate = lessonStartDate
        lesson.lessonEndDate = lessonEndDate
        lesson.paymentDate = isPaid ? paymentDate : nil
        lesson.paymentAmount = paymentAmount ?? 0
        lesson.lessonDescription = lessonDescription
        lesson.isPaid = isPaid
    }
    
    
    func addLessonToStudent(student: Student, context: ModelContext){
        let newLesson = Lesson(
            lessonStartDate: lessonStartDate,
            lessonEndDate: lessonEndDate,
            paymentDate: paymentDate,
            paymentAmount: paymentAmount!,
            lessonDescription: lessonDescription == "" ? "lesson \(lessonStartDate.formatted())" : lessonDescription,
            isPaid: isPaid)
        
        newLesson.student = student
        
        context.insert(newLesson)
    }
    
    func suggestedLessonPrice(student: Student) -> Int{
        let timeInSec = lessonEndDate.timeIntervalSince(lessonStartDate)
        let timeInHours = (timeInSec/3600)
        
        let price = timeInHours * Double(student.hourlyRate)
        
        return Int(price.rounded(.up))
    }
    
    var isFormValid : Bool {
        paymentAmount != nil
    }
    
    
    
    
}
