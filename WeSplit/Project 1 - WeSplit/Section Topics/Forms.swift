import SwiftUI

struct FormsView: View {
    var body: some View {
        //SwiftUI gives us a dedicated view type for this purpose, called Form. Forms are scrolling lists of static controls like text and images, but can also include user interactive controls like text fields, toggle switches, buttons, and more.
        VStack{
            Text("First Form")
            Form {
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }
            //If you want to split your form up into visual chunks, just like the Settings app does, you can use Section like this:
            Text("Second Form - split view")
            Form {
                Section {
                    Text("Hello, world!")
                }
                
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    FormsView()
}
