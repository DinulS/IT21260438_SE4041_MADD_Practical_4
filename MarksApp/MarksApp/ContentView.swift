import SwiftUI

// Final Practical Task - Student Marks App
struct ContentView: View {

    private enum Field {
        case name, mark
    }

    // Part B - State Variables
    @State private var students: [Student] = []
    @State private var studentName = ""
    @State private var markText = ""
    @State private var errorMessage: String?
    @FocusState private var focusedField: Field?

    // Part G - Passed Student Count, recomputed whenever `students` changes
    private var passedCount: Int {
        students.filter { $0.passed }.count
    }

    var body: some View {

        NavigationStack {

            VStack(spacing: 16) {

                // Part C - Input Interface
                VStack(spacing: 12) {

                    TextField("Student Name", text: $studentName)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.words)
                        .focused($focusedField, equals: .name)
                        .accessibilityIdentifier("nameField")

                    TextField("Mark (0-100)", text: $markText)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .focused($focusedField, equals: .mark)
                        .accessibilityIdentifier("markField")

                    if let errorMessage {
                        Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
                            .font(.footnote)
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Button(action: addStudent) {
                        Label("Add Student", systemImage: "person.badge.plus")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .accessibilityIdentifier("addStudentButton")
                }
                .padding(.horizontal)

                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundStyle(.green)

                    Text("Passed Students: \(passedCount)")
                        .font(.headline)
                        .accessibilityIdentifier("passedCount")
                }

                // Part E - Student List, Part F - NavigationLink to the detail screen
                List(students) { student in
                    NavigationLink {
                        StudentDetailView(student: student)
                    } label: {
                        StudentRow(student: student)
                    }
                }
                .overlay {
                    if students.isEmpty {
                        ContentUnavailableView(
                            "No Students Yet",
                            systemImage: "person.3",
                            description: Text("Add a student to see their result here.")
                        )
                    }
                }
            }
            .padding(.top)
            .navigationTitle("SE4041 Marks")
        }
    }

    // Part D - Add a Student
    private func addStudent() {

        let name = studentName.trimmingCharacters(in: .whitespaces)

        guard !name.isEmpty else {
            errorMessage = "Enter a student name."
            return
        }

        guard let mark = Int(markText.trimmingCharacters(in: .whitespaces)) else {
            errorMessage = "Mark must be a whole number."
            return
        }

        guard mark >= 0 && mark <= 100 else {
            errorMessage = "Mark must be between 0 and 100."
            return
        }

        students.append(Student(name: name, mark: mark))

        studentName = ""
        markText = ""
        errorMessage = nil
        focusedField = nil // hides the keyboard so the list is visible
    }
}

#Preview {
    ContentView()
}
