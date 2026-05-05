//
//  ExporterCSV.swift
//  korki
//
//  Created by Mikołaj Skarbek on 05/05/2026.
//

import Foundation

class ExporterCSV {
    static func convertToStringCSV(lessons: [Lesson]) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

        var csvRows = ["id;start;end;price;payment_date"]
        var id = 0

        for lesson in lessons where lesson.isPaid {
            let start = dateFormatter.string(from: lesson.lessonStartDate)
            let end = dateFormatter.string(from: lesson.lessonEndDate)
            let price = String(lesson.paymentAmount)
                       
            let paymentDateStr = lesson.paymentDate != nil ? dateFormatter.string(from: lesson.paymentDate!) : "none"
            let row = "\(id);\(start);\(end);\(price);\(paymentDateStr)"
            csvRows.append(row)
            
            id += 1
        }
        return csvRows.joined(separator: "\n")
    }
    
}

