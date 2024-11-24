import SwiftUI

struct ButtonImageView: View {
    var body: some View {
        /// There are a few different ways we can customize the way buttons look. First, we can attach a role to the button, which iOS can use to adjust its appearance both visually and for screen readers. For example, we could say that our Delete button has a destructive role. Second, we can use one of the built-in styles for buttons: .bordered and .borderedProminent. These can be used by themselves, or in combination with a role:
        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            
            /// If you want to customize the colors used for a bordered button, use the tint() modifier like this:
            Button("Button 5") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            
            /// If you want something completely custom, you can pass a custom label using a second trailing closure:
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.green)
            }.padding()
            /// Image Button without text
            Button {
                print("Edit button was tapped")
            } label: {
                Image(systemName: "pencil")
            }.padding()
            
            /// Button with text and image
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            /// Transparent Button with text and image
            Button("Edit", systemImage: "pencil") {
                print("Edit button was tapped")
            }.padding()
            
        }
    }
    
    func executeDelete() {
        print("Now deleting…")
    }
}

#Preview {
    ButtonImageView()
}
