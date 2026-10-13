import SwiftUI

// Exercise 04 - @State and Buttons
struct Exercise04View: View {

    // Changing this value makes SwiftUI recompute `body`
    @State private var count = 0

    var body: some View {

        VStack(spacing: 20) {

            Text("Button tapped \(count) times")
                .font(.title2)

            Button("Tap Me") {
                count += 1
            }
            .buttonStyle(.borderedProminent)

            Button("Reset") {
                count = 0
            }
        }
        .padding()
    }
}

#Preview {
    Exercise04View()
}
