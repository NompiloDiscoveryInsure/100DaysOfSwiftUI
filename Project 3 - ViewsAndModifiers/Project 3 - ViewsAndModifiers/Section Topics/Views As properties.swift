import SwiftUI

struct ViewPropertiesView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        /// There are lots of ways to make it easier to use complex view hierarchies in SwiftUI, and one option is to use properties – to create a view as a property of your own view, then use that property inside your layouts. For example, we could create two text views like this as properties, then use them inside a VStack:
        VStack {
            motto1
            motto2
        }.padding()
        
        /// You can even apply modifiers directly to those properties as they are being used, like this:
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
        }
        .padding()
        
        /// Creating views as properties can be helpful to keep your body code clearer – not only does it help avoid repetition, but it can also get more complex code out of the body property. Swift doesn’t let us create one stored property that refers to other stored properties, because it would cause problems when the object is created. This means trying to create a TextField bound to a local property will cause problems. However, you can create computed properties if you want, like this:
    }
    
    var motto3: some View {
        Text("Draco dormiens")
    }
    
    /// This is often a great way to carve up your complex views into smaller chunks, but be careful: unlike the body property, Swift won’t automatically apply the @ViewBuilder attribute here, so if you want to send multiple views back you have three options. First, you can place them in a stack, like this:
    var spells: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    /// If you don’t specifically want to organize them in a stack, you can also send back a Group. When this happens, the arrangement of your views is determined by how you use them elsewhere in your code:
    var spells2: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    /// The third option is to add the @ViewBuilder attribute yourself, like this:
    @ViewBuilder var spells3: some View {
        Text("Lumos")
        Text("Obliviate")
    }
}

#Preview {
    ViewPropertiesView()
}
