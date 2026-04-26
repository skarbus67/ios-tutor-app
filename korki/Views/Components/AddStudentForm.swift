//
//  SwiftUIView.swift
//  korki
//
//  Created by Mikołaj Skarbek on 25/04/2026.
//

import SwiftUI
import SwiftData

struct AddStudentForm: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    @State private var viewModel = StudentsViewModel()
    
    @State var name: String = ""
    @State var surname: String = ""
    @State var subject: String = ""
    @State var hourlyRate: Int? = nil
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("")){
                    TextField("name", text: $name)
                    TextField("surname", text: $surname)
                    TextField("hourly rate", value: $hourlyRate, format: .number)
                        .keyboardType(.numberPad)
                    TextField("subject", text: $subject)
                }

            }
            .navigationTitle("new student")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("add") {
                        let rate = hourlyRate ?? 0
                        viewModel.addStudent(name: name, surname: surname, hourlyRate: rate, subject: subject, context: context)
                        dismiss()
                    }
                    .disabled(name.isEmpty || surname.isEmpty || subject.isEmpty || hourlyRate == nil)
                }
            }

        }
    }
}

#Preview {
    VStack{}
        .sheet(isPresented: .constant(true)) {
        AddStudentForm()
        }
}
