import SwiftUI

// Exercise 02 - View Modifiers
struct Exercise02View: View {

    var body: some View {

        VStack(spacing: 30) {

            Text("Welcome to SE4041")
                .font(.title)
                .bold()
                .foregroundStyle(.blue)
                .padding()

            // Experiment - modifier order changes the result
            // padding first: the orange background includes the padding
            Text("SE4041")
                .padding()
                .background(.orange)

            // background first: only the text is orange, the padding is outside it
            Text("SE4041")
                .background(.orange)
                .padding()
        }
    }
}

#Preview {
    Exercise02View()
}
