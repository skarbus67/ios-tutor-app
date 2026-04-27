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
    @State private var viewModel = StudentsViewModel()
    @Environment(\.modelContext) private var context
    @State var showAddLessonForm: Bool = false
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("student data")){
                    Text(student.name + " " + student.surname)
                    Text("\(student.hourlyRate)zl/h")
                    Text(student.subject)
                }
                Section(header: Text("lessons")){
                    ForEach(student.lessons) {lesson in
                        lessonButton(lesson: lesson)
                    }
                        
                    Button(action: {showAddLessonForm = true}){
                        Text("add lesson")
                    }
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
                    .disabled(true)
                }
            }
            
            Spacer()
            Button(action: {
                viewModel.deleteStudent(student: student, context: context)
                dismiss()
            }){
                Text("delete")
                
                   
            }
            .foregroundColor(Color.red)
            

        }
        .sheet(isPresented: $showAddLessonForm) {
            AddLessonForm(student: student)
        }
    }
    
    func lessonButton(lesson: Lesson) -> some View{
        HStack{
            Button(action: {}){
            Text(lesson.lessonDescription)
            }
            Spacer()
            if(lesson.isPaid){
                Text("paid")
                    .foregroundColor(Color.green)
            }else{
                Text("not paid")
                    .foregroundColor(Color.red)
            }
        }
        
    }
}

#Preview {
    @Previewable @State var s1 : Student = Student(name: "miki", surname: "skarbek", hourlyRate: 80, subject: "matma")
    VStack{}
        .sheet(isPresented: .constant(true)) {
            
            EditStudentForm(student: s1)
        }
        .modelContainer(for: Lesson.self)
    
}
