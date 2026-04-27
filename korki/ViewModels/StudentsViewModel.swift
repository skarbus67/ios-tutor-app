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
    var name: String = ""
    var surname: String = ""
    var subject: String = ""
    var hourlyRate: Int? = nil
    
    var isFormValid: Bool {
        !name.isEmpty && !surname.isEmpty && !subject.isEmpty && hourlyRate != nil
    }

    func addStudent(context: ModelContext) {
        let student = Student(name: name, surname: surname, hourlyRate: hourlyRate!, subject: subject)
        context.insert(student)
    }
    
    func deleteStudent(student: Student, context: ModelContext){
        context.delete(student)
    }
}
