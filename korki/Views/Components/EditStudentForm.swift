//
//  EditStudentForm.swift
//  korki
//
//  Created by Mikołaj Skarbek on 27/04/2026.
//

import SwiftUI
import SwiftData

struct EditStudentForm: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var student: Student
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("student data")){
                    Text(student.name + " " + student.surname)
                    Text("\(student.hourlyRate)zl/h")
                    Text(student.subject)
                }
                Section(header: Text("lessons")){
                    Text("lekcja")
                }

                
            }
            .navigationTitle(student.name + " " + student.surname)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("edit") {
                    }
                    .fontWeight(.regular)
                }
            }

        }
    }
}

#Preview {
    @Previewable @State var s1 : Student = Student(name: "miki", surname: "skarbek", hourlyRate: 69, subject: "matma")
    VStack{}
        .sheet(isPresented: .constant(true)) {

            EditStudentForm(student: s1)
        }
}
