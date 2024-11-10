import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }
            }
            .navigationTitle("SwiftUI") // navigation bar title
            .navigationBarTitleDisplayMode(.inline) //navigaton bar small font modifier since default font is large and alignment
        }
    }
}

#Preview {
    NavigationBarView()
}
