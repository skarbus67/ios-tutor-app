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
    
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("")){
                    TextField("name", text: $viewModel.name)
                    TextField("surname", text: $viewModel.surname)
                    TextField("hourly rate", value: $viewModel.hourlyRate, format: .number)
                        .keyboardType(.numberPad)
                    TextField("subject", text: $viewModel.subject)
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
                        viewModel.addStudent(context: context)
                        dismiss()
                    }
                    .disabled(!viewModel.isFormValid)
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
