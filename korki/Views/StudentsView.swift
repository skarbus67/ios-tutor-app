//
//  StudentsView.swift
//  korki
//
//  Created by Mikołaj Skarbek on 23/04/2026.
//

import SwiftUI
import SwiftData

struct StudentsView: View {
    @Environment(\.modelContext) private var context
    @Query var students: [Student]
    @State var addStudent: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(students) { student in
                    studentButton(student: student)
                }
                addButton()
                Spacer()
            }
            .sheet(isPresented: $addStudent){
                AddStudentForm()
            }
        }
    }
    
    func addButton() -> some View {
        Button(action: {addStudent = true}){
                Text("add student")
            }
            .buttonStyle(addButtonStyle())
        }
    
    func studentButton(student: Student) -> some View{
        Button(action: {}){
            Text(student.name + " " + student.surname)
        }
        .buttonStyle(studentButtonStyle())
    }
    
}


struct addButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .bold()
            .padding(.top, 20)
            .padding(.bottom, 20)
            .padding(.horizontal, 70)
            .foregroundColor(Color.white)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .background(Color(white: 0.2))
            .cornerRadius(40)
            .padding(.top, 50)
        
    }
}

struct studentButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .bold()
            .padding(.vertical, 20)
            .frame(width: 300)
            .foregroundColor(.white)
            .background(Color(white: 0.2))
            .cornerRadius(40)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
        
    }
}


#Preview {
    StudentsView()
}
