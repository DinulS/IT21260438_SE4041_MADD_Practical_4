# Practical 04 - Knowledge Check

1. **`ContentView`:** The first screen of the app. `WindowGroup` in `MarksAppApp` shows it when the app starts.
2. **Why a view is a `struct`:** Views are small, lightweight value types that describe the UI. SwiftUI creates new copies whenever the data changes, which is cheap and safe with structs.
3. **`body`:** A computed property that returns what the view should show on screen. SwiftUI recomputes it whenever the view's state changes.
4. **Modifier:** A method such as `.font()` or `.padding()` that wraps a view and returns a new, changed view. Their order matters.
5. **`VStack` vs `HStack`:** `VStack` arranges views vertically (top to bottom); `HStack` arranges them horizontally (side by side).
6. **`Spacer()`:** Takes up all the available empty space, pushing the other views in the stack apart.
7. **SF Symbol:** One of Apple's built-in system icons, used with `Image(systemName:)` and styled like text (e.g. `.font()`, `.foregroundStyle()`).
8. **Why `@State`:** It stores a value owned by the view that can change while the app runs. When it changes, SwiftUI updates the screen automatically.
9. **`name` vs `$name`:** `name` is the current value (read only). `$name` is a binding, a two-way connection that lets a control like `TextField` read and change the value.
10. **What `Button` executes:** The closure (action) given to it, e.g. `count += 1` or the add-student code.
11. **What `Identifiable` provides:** A unique `id` for each item, so SwiftUI can tell items apart in a `List` even if two have the same name or mark.
12. **`List`:** Shows a scrolling list of rows, one for each item in a collection such as an array of students.
13. **`NavigationStack`:** A container that manages a stack of screens and the navigation history, with a navigation bar and back button.
14. **`NavigationLink`:** A tappable view that pushes a destination screen (e.g. `StudentDetailView`) onto the navigation stack.
15. **Why a separate subview is useful:** It keeps `body` short and readable and lets the same UI be reused, e.g. `StudentRow` for every row and `StudentDetailView` for every student.
