import Foundation
import SwiftUI

// SwiftUI’s @State property wrapper lets us modify our view structs freely, which means as our program changes we can update our view properties to match. However, things are a little more complex with user interface controls. Two-way binding: we bind the text field so that it shows the value of our property, but we also bind it so that any changes to the text field also update the property. In Swift, we mark these two-way bindings with a special symbol so they stand out: we write a dollar sign before them. This tells Swift that it should read the value of the property but also write it back as any changes happen.

struct TextFormView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
    }
}



#Preview {
    TextFormView()
}


