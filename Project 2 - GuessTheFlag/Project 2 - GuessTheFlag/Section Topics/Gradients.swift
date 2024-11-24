import SwiftUI

struct GradientsView: View {
    var body: some View {
        //SwiftUI gives us four kinds of gradients to work with, and like colors most of them are also views that can be drawn in our UI.
        
        // 1. LinearGradient
        VStack {
            ///a linear gradient goes in one direction, so we provide it with a start and end point like this:
            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
        }
        
        VStack {
            ///We can also provide that with gradient stops, which let you specify both a color and how far along the gradient the color should be used. For example, we could specify that our gradient should be white from the start up to 45% of the available space, then black from 55% of the available space onwards:
//            LinearGradient(stops: [
//                Gradient.Stop(color: .white, location: 0.45),
//                Gradient.Stop(color: .black, location: 0.55),
//            ], startPoint: .top, endPoint: .bottom) 
            
            ///Tip: Swift knows we’re creating gradient stops here, so as a shortcut we can just write .init rather than Gradient.Stop, like this:
            
            LinearGradient(stops: [
                .init(color: .white, location: 0.45),
                .init(color: .black, location: 0.55),
            ], startPoint: .top, endPoint: .bottom)
        }
        
        // 2. RadialGradient
        
        VStack {
            ///As an alternative, radial gradients move outward in a circle shape, so instead of specifying a direction we specify a start and end radius – how far from the center of the circle the color should start and stop changing. For example:
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        }
        
        // 3. AngularGradient
        VStack {
            ///The last gradient that's also a view is called an angular gradient, although you might have heard it referred to elsewhere as a conic or conical gradient. This cycles colors around a circle rather than radiating outward, and can create some beautiful effects.. For example:
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
        }
        
        
        // SwiftUI provides a fourth type of gradient that's simpler than these first three – you don't get any control over it, and you also can use them only as backgrounds and foreground styles rather than individual views. This gradient is created by simply adding .gradient after any color – SwiftUI will automatically convert your color into a very gentle linear gradient. Try it like this:
        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.red.gradient)
    }
}

#Preview {
    GradientsView()
}
