import SwiftUI

// Reusable row subview used by the student list
struct StudentRow: View {

    let student: Student

    var body: some View {

        HStack {

            Text(student.name)

            Spacer()

            Text("\(student.mark)")
                .bold()
                .foregroundStyle(student.passed ? Color.green : .red)

            // Icon as well as colour, so pass/fail does not rely on colour alone
            Image(systemName: student.passed ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(student.passed ? Color.green : .red)
                .accessibilityLabel(student.passed ? "Pass" : "Fail")
        }
    }
}

#Preview {
    List {
        StudentRow(student: Student(name: "Amal", mark: 72))
        StudentRow(student: Student(name: "Nimali", mark: 45))
    }
}
