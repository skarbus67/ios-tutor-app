//
//  EditLessonForm.swift
//  korki
//
//  Created by Mikołaj Skarbek on 28/04/2026.
//

import SwiftUI
import SwiftData

struct EditLessonForm: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    @State var lesson: Lesson
    
    @State var viewModel : LessonViewModel

    init(lesson: Lesson) {
        self.lesson = lesson
        self._viewModel = State(initialValue: LessonViewModel(lesson: lesson))
    }
    

    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    
                    Text(viewModel.lessonDescription)

                    DatePicker("start date", selection: $viewModel.lessonStartDate, displayedComponents: [.date, .hourAndMinute])
                        .disabled(true)
                    
                    DatePicker("end date", selection: $viewModel.lessonEndDate, displayedComponents: [.date, .hourAndMinute])
                        .disabled(true)
                    
                    Text("price : " + String(viewModel.paymentAmount!) + " pln")
                
                    Toggle("is paid", isOn: $viewModel.isPaid)
                    
                    if viewModel.isPaid {
                            DatePicker("payment date", selection: Binding(
                                get: { viewModel.paymentDate ?? .now },
                                set: { viewModel.paymentDate = $0 }
                            ), displayedComponents: [.date, .hourAndMinute])
                        }
                }
            }
            .navigationTitle("lesson")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("save"){
                        viewModel.update(lesson: lesson)
                        dismiss()
                    }
                    .fontWeight(.regular)
                }
            }
        }
        
    }
}

#Preview {
    
    @Previewable @State var s1 = Student(name: "miki", surname: "skarbek", hourlyRate: 80, subject: "matma")
    @Previewable @State var l1 = Lesson(lessonStartDate: .now, lessonEndDate: .now.advanced(by: 3600), paymentDate: nil, paymentAmount: 90, lessonDescription: "lesson 1", isPaid: false)
    
    Color.clear
        .sheet(isPresented: .constant(true)) {
            EditLessonForm(lesson: l1)
        }
        .onAppear {
            l1.student = s1
        }
        .modelContainer(for: [Student.self, Lesson.self], inMemory: true)
}


