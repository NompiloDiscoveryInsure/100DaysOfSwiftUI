import SwiftUI

struct ConditionalModifierView: View {
    ///   It’s common to want modifiers that apply only when a certain condition is met, and in SwiftUI the easiest way to do that is with the ternary conditional operator. For example, if you had a property that could be either true or false, you could use that to control the foreground style of a button like this:
    @State private var useRedText = false
    
    var body: some View {
        Button("Button 1") {
            // flip the Boolean between true and false
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .blue)
        
        
        /// You can often use regular if conditions to return different views based on some state, but this actually creates more work for SwiftUI – rather than seeing one Button being used with different colors, it now sees two different Button views, and when we flip the Boolean condition it will destroy one to create the other rather than just recolor what it has.
        if useRedText {
            Button("Red") {
                useRedText.toggle()
            }
            .foregroundStyle(.red)
        } else {
            Button("blue") {
                useRedText.toggle()
            }
            .foregroundStyle(.blue)
        }
    }
}


#Preview {
    ConditionalModifierView()
}
