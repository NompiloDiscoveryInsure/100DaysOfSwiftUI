import SwiftUI

struct ColorFrameView: View {
    
    // SwiftUI gives us a range of functionality to render colors, and manages to be both simple and powerful – a difficult combination, but one they really pulled off.
    var body: some View {
        NavigationStack {
            // Colors:
            // 1. Colors automatically take up all the space available, but you can also use the frame() modifier to ask for specific sizes.
            // 2. You can also specify minimum and maximum widths and heights, depending on the layout you want.
            // 3. You can create custom colors by passing in values between 0 and 1 for red, green, and blue
            // 4. If you want your content to go under the safe area, you can use the .ignoresSafeArea() modifier to specify which screen edges you want to run up to, or specify nothing to automatically go edge to edge.
            ZStack {
                Color(red: 1, green: 0.8, blue: 0)
                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
                Text("Your content")
            }
            .ignoresSafeArea()
            
            //Before we’re done, there’s one more thing I want to mention: as well as using fixed colors such as .red and .green, the background() modifier can also accept materials. These apply a frosted glass effect over whatever comes below them, which allows us to create some beautiful depth effects.
            ZStack {
                VStack(spacing: 0) {
                    Color.red
                    Color.blue
                }
                
                Text("Your content")
                    .foregroundStyle(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ColorFrameView()
}
