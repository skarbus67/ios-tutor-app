//
//  AddLessonForm.swift
//  korki
//
//  Created by Mikołaj Skarbek on 27/04/2026.
//

import SwiftUI

struct AddLessonForm: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @State var student: Student
    
    @State private var viewModel = LessonViewModel()
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("description (optional)", text: $viewModel.lessonDescription)

                    DatePicker("start date", selection: $viewModel.lessonStartDate, displayedComponents: [.date, .hourAndMinute])
                    
                    DatePicker("end date", selection: $viewModel.lessonEndDate, displayedComponents: [.date, .hourAndMinute])
                    
                    
                    TextField("payment amount, (suggested : \(viewModel.suggestedLessonPrice(student: student)))", value: $viewModel.paymentAmount, format: .number)
                        .keyboardType(.numberPad)
                    
                    Toggle("is paid", isOn: $viewModel.isPaid)
                    
                    if viewModel.isPaid {
                            DatePicker("payment date", selection: Binding(
                                get: { viewModel.paymentDate ?? .now },
                                set: { viewModel.paymentDate = $0 }
                            ), displayedComponents: [.date, .hourAndMinute])
                        }
                }
            }
            .navigationTitle("add lesson")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("add"){
                        viewModel.addLessonToStudent(student: student, context: context)
                        dismiss()
                    }
                    .disabled(!viewModel.isFormValid)
                }
            }
        }
        
    }
}

#Preview {
    @Previewable @State var s1 : Student = Student(name: "miki", surname: "skarbek", hourlyRate: 80, subject: "matma")
    HStack{
    }
    .sheet(isPresented: .constant(true)){
        AddLessonForm(student: s1)
    }
}
