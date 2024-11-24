import SwiftUI

struct AlertMessagesView: View {
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @State private var showingAlert3 = false
    
    var body: some View {
        /// A basic SwiftUI alert has a title and a button that dismisses it, but the more interesting part is how we present that alert: we don’t assign the alert to a variable.
        /// We then attach our alert somewhere to our user interface, telling it to use that state to determine whether the alert is presented or not. SwiftUI will watch showingAlert, and as soon as it becomes true it will show the alert. Putting that all together, here’s some example code that shows an alert when a button is tapped.
        /// That attaches the alert to the button, but honestly it doesn’t matter where the alert() modifier is used – all we’re doing is saying that an alert exists and is shown when showingAlert is true.
        Button("Show Alert 1") {
            showingAlert1 = true
        }
        .alert("Important message", isPresented: $showingAlert1) {
            Button("OK") { }
        }
        
        /// You can add more buttons to your alert, and this is a particularly good place to add roles to make sure it’s clear what each button does:
        Button("Show Alert 2") {
            showingAlert2 = true
        }
        .alert("Important message", isPresented: $showingAlert2) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        }
        
        /// you can add message text to go alongside your title with a second trailing closure, like this:
        Button("Show Alert 3") {
            showingAlert3 = true
        }
        .alert("Important message", isPresented: $showingAlert3) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }
        
    }
}

#Preview {
    AlertMessagesView()
}

