import SwiftUI

// Exercise 06 - the Student model is in Student.swift
// Exercise 07 - Displaying Data with List, showing pass and fail visually
struct Exercise07View: View {

    @State private var students = [

        Student(name: "Amal", mark: 72),
        Student(name: "Nimali", mark: 45),
        Student(name: "Ruwan", mark: 58)
    ]

    var body: some View {

        List(students) { student in

            HStack {

                Text(student.name)

                Spacer()

                Text("\(student.mark)")
                    .bold()
                    .foregroundStyle(
                        student.passed ? Color.green : .red
                    )
            }
        }
    }
}

#Preview {
    Exercise07View()
}
