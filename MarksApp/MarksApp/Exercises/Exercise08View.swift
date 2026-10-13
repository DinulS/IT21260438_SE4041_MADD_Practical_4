import SwiftUI

// Exercise 08 - Navigation to StudentDetailView
struct Exercise08View: View {

    @State private var students = [

        Student(name: "Amal", mark: 72),
        Student(name: "Nimali", mark: 45),
        Student(name: "Ruwan", mark: 58)
    ]

    var body: some View {

        NavigationStack {

            List(students) { student in

                NavigationLink {
                    StudentDetailView(student: student)
                } label: {

                    HStack {

                        Text(student.name)

                        Spacer()

                        Text("\(student.mark)")
                    }
                }
            }
            .navigationTitle("SE4041 Marks")
        }
    }
}

#Preview {
    Exercise08View()
}
