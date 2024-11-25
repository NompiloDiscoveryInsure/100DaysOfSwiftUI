import SwiftUI

// A view that displays two mottos with different foreground styles
struct MottoView: View {
    // Text for the first motto
    let motto1 = Text("Draco dormiens")
    // Text for the second motto
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        VStack {
            // Nested VStack to organize the mottos vertically
            VStack {
                motto1
                    .foregroundStyle(.red) // Sets the color of the first motto to red
                motto2
                    .foregroundStyle(.blue) // Sets the color of the second motto to blue
            }
        }
    }
}

// A custom view for displaying text inside a capsule shape
struct CapsuleText: View {
    var text: String // The text to display
    
    var body: some View {
        Text(text)
            .font(.largeTitle) // Sets the font size to large
            .padding() // Adds padding around the text
            .foregroundStyle(.white) // Sets the text color to white
            .background(.blue) // Sets the background color to blue
            .clipShape(.capsule) // Clips the background into a capsule shape
    }
}

// A custom view modifier to style text as a title
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle) // Sets the font size to large
            .foregroundStyle(.white) // Sets the text color to white
            .padding() // Adds padding around the text
            .background(.blue) // Sets the background color to blue
            .clipShape(.rect(cornerRadius: 10)) // Clips the background with rounded corners
    }
}

// An extension to make applying the Title modifier easier
extension View {
    func titleStyle() -> some View {
        self.modifier(Title()) // Applies the Title view modifier
    }
}

// A custom view modifier to add a watermark at the bottom-right corner
struct Watermark: ViewModifier {
    var text: String // The watermark text
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content // The main content of the view
            Text(text)
                .font(.caption) // Sets the font size to caption
                .foregroundStyle(.white) // Sets the text color to white
                .padding(5) // Adds padding around the watermark text
                .background(.black) // Sets the background color to black
        }
    }
}

// An extension to make applying the Watermark modifier easier
extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text)) // Applies the Watermark view modifier
    }
}

// A flexible grid view that accepts a closure to define its content
struct GridStack<Content: View>: View {
    let rows: Int // The number of rows in the grid
    let columns: Int // The number of columns in the grid
    let content: (Int, Int) -> Content // A closure to generate content for each cell
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
    var body: some View {
        VStack {
            // Loops through each row
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    // Loops through each column
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column) // Generates content for each cell
                    }
                }
            }
        }
    }
}

// The main view displaying various elements
struct ContentView: View {
    var body: some View {
        VStack {
            // A text view with multiple layers of padding and background colors
            Text("Hello World")
                .padding() // Adds padding
                .background(.red) // Red background
                .padding()
                .background(.blue) // Blue background
                .padding()
                .background(.green) // Green background
                .padding()
                .background(.yellow) // Yellow background
            
            // A button that prints the type of its body when clicked
            Button("Hello World") {
                print(type(of: self.body)) // Prints the type of the body
            }
            .frame(width: 200, height: 200) // Sets the frame size
            .background(.red) // Red background
            
            // A vertical stack of CapsuleText views with different styles
            VStack(spacing: 10) {
                CapsuleText(text: "First")
                    .foregroundStyle(.white) // Sets the text color to white
                CapsuleText(text: "Second")
                    .foregroundStyle(.yellow) // Sets the text color to yellow
            }
            
            // A 4x4 grid displaying system icons and corresponding text
            GridStack(rows: 4, columns: 4) { row, col in
                Image(systemName: "\(row * 4 + col).circle") // Displays a system icon
                Text("R\(row) C\(col)") // Displays the row and column numbers
            }
        }
    }
}

#Preview {
    ContentView()
}
