import Foundation
import SwiftUI

//It’s common to want to create several SwiftUI views inside a loop. For example, we might want to loop over an array of names and have each one be a text view, or loop over an array of menu items and have each one be shown as an image. SwiftUI gives us a dedicated view type for this purpose, called ForEach. This can loop over arrays and ranges, creating as many views as needed. ForEach will run a closure once for every item it loops over, passing in the current loop item.

//ForEach is particularly useful when working with SwiftUI’s Picker view, which lets us show various options for users to select from.
/// To demonstrate this, we’re going to define a view that:
/// 1. Has an array of possible student names.
/// 2. Has an @State property storing the currently selected student.
/// 3. Creates a Picker view asking users to select their favorite, using a two-way binding to the @State property.
/// 4. Uses ForEach to loop over all possible student names, turning them into a text view.

struct LoopView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

//1. The students array doesn’t need to be marked with @State because it’s a constant; it isn’t going to change.
//2. The selectedStudent property starts with the value “Harry” but can change, which is why it’s marked with @State.
//3. The Picker has a label, “Select your student”, which tells users what it does and also provides something descriptive for screen readers to read aloud.
//4. The Picker has a two-way binding to selectedStudent, which means it will start showing a selection of “Harry” but update the property when the user selects something else.
//5. Inside the ForEach we loop over all the students.
//6. For each student we create one text view, showing that student’s name.
//                                                                                                                            
//The only confusing part in there is this: ForEach(students, id: \.self). That loops over the students array so we can create a text view for each one, but the id: \.self part is important. This exists because SwiftUI needs to be able to identify every view on the screen uniquely, so it can detect when things change.

#Preview {
    LoopView()
}

