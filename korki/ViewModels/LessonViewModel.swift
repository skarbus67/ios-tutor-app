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
        let timeInHours = (timeInSec/3600).rounded(.up)
        
        let price = timeInHours * Double(student.hourlyRate)
        
        return Int(price)
    }
    
    var isFormValid : Bool {
        paymentAmount != nil
    }
    
    
    
    
}
