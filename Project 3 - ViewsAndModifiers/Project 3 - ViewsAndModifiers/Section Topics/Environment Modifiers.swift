import SwiftUI

struct EnvironmentModifierView: View {
    
    var body: some View {
        /// Many modifiers can be applied to containers, which allows us to apply the same modifier to many views at the same time. For example, if we have four text views in a VStack and want to give them all the same font modifier, we could apply the modifier to the VStack directly and have that change apply to all four text views:
        VStack {
            Text("Gryffindor")
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        .padding()
        /// This is called an environment modifier, and is different from a regular modifier that is applied to a view. As an example, this shows our four text views with the title font, but one has a large title:
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        .foregroundStyle(.blue)
        .padding()
        /// The font() is an environment modifier, which means the Gryffindor text view can override it with a custom font. blur() is a regular modifier, so any blurs applied to child views are added to the VStack blur rather than replacing it.
        VStack {
            Text("Gryffindor")
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 4)
        .padding()
    }
}

#Preview {
    EnvironmentModifierView()
}
