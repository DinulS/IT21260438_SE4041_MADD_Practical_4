import SwiftUI

// Exercise 05 - TextField and Binding
struct Exercise05View: View {

    @State private var name = ""

    var body: some View {

        VStack(spacing: 20) {

            Text("Student Registration")
                .font(.title)
                .bold()

            // $name is a binding: the TextField can read and change `name`
            TextField("Enter student name", text: $name)
                .textFieldStyle(.roundedBorder)

            if name.isEmpty {

                Text("Enter your name above")

            } else {

                Text("Welcome, \(name)")
            }
        }
        .padding()
    }
}

// Mini Activity - Student Result Input
struct StudentResultInputView: View {

    @State private var studentName = ""
    @State private var mark = ""

    var body: some View {

        VStack(spacing: 20) {

            TextField("Student Name", text: $studentName)
                .textFieldStyle(.roundedBorder)

            TextField("Mark", text: $mark)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            Button("Show Result") {

            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview("Exercise 05") {
    Exercise05View()
}

#Preview("Mini Activity") {
    StudentResultInputView()
}
