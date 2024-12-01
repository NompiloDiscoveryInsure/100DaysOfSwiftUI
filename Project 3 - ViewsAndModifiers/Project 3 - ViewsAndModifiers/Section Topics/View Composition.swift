import SwiftUI

struct ViewCompositionView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Text 1")
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.capsule)
            
            Text("Text 2")
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.capsule)
        }.padding()
        
        // We can then use that CapsuleText view inside our original view, like this:
        VStack(spacing: 10) {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
        }.padding()
        
        /// Of course, we can also store some modifiers in the view and customize others when we use them. For example, if we removed foregroundStyle() from CapsuleText, we could then apply custom colors when creating instances of that view like this:
        VStack(spacing: 10) {
            CapsuleText(text: "Hello")
                .foregroundStyle(.white)
            CapsuleText(text: "Hi")
                .foregroundStyle(.yellow)
        }.padding()
    }
    
    /// Because the two text views are identical apart from their text, we can wrap them up in a new custom view, like this:
    struct CapsuleText: View {
        var text: String
        
        var body: some View {
            Text(text)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.capsule)
        }
    }
    
}

#Preview {
    ViewCompositionView()
}
