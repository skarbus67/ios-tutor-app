//
//  StudentsViewModel.swift
//  korki
//
//  Created by Mikołaj Skarbek on 22/04/2026.
//

import Foundation
import SwiftData
import Observation

@Observable
class StudentsViewModel {
    func addStudent(name: String, surname: String, hourlyRate: Int, subject: String, context: ModelContext){
        context.insert(Student(name: name, surname: surname, hourlyRate: hourlyRate, subject: subject))
        try? context.save()
    }
    
    
    func deleteStudent(student: Student, context: ModelContext){
        context.delete(student)
        try? context.save()
    }
    
}
