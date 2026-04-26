//
//  Student.swift
//  korki
//
//  Created by Mikołaj Skarbek on 22/04/2026.
//

import Foundation
import SwiftData

@Model
class Student{
    @Attribute(.unique) var id: UUID = UUID()
    var name: String
    var surname : String
    var hourlyRate : Int
    var subject : String
    
    init(name: String, surname: String, hourlyRate: Int, subject: String) {
        self.name = name
        self.surname = surname
        self.hourlyRate = hourlyRate
        self.subject = subject
    }
    
}
