import SwiftUI

struct StackView: View {
//    When we return some View for our body, SwiftUI expects to receive back some kind of view that can be displayed on the screen. That might be a navigation view, a form, a text view, a picker, or something else entirely, but it must conform to the View protocol so that it can be drawn on the screen.
//        
//        If we want to return multiple things neatly arranged then we have various options, but three are particularly useful. They are HStack, VStack, and ZStack, which handle horizontal, vertical, and, er, zepth.
    
    
    var body: some View {
        NavigationStack {
            Form{
                VStack {
                    //We can choose to place the two text views loosely like that, or in an explicit VStack:
                    Section {
                        Text("This is inside a VStack")
                        Text("This is inside a VStack")
                    }
                }
                
                VStack(spacing: 20) {
                    Section {
                        //By default VStack places some automatic amount of spacing between the two views, but we can control the spacing by providing a parameter when we create the stack:
                        Text("This is inside a VStack with spacing: 20")
                        Text("This is inside a VStack with spacing: 20")
                    }
                }
                
                VStack(alignment: .leading) {
                    Section {
                        //By default, VStack aligns its views so they are centered, but you can control that with its alignment property. For example, this aligns the text views to their leading edge, which in a left-to-right language such as English will cause them to be aligned to the left:
                        Text("This is inside a VStack with alignment: .leading")
                        Text("This is inside a VStack with alignment: .leading")
                    }
                }
                
                HStack(spacing: 20) {
                    Section {
                        //Alongside VStack we have HStack for arranging things horizontally. This has the same syntax as VStack, including the ability to add spacing and alignment:
                        Text("This is inside a HStack with spacing: 20")
                        Text("This is inside a HStack with spacing: 20")
                    }
                }
                
                VStack {
                    //Vertical and horizontal stacks automatically fit their content, and prefer to align themselves to the center of the available space. If you want to change that you can use one or more Spacer views to push the contents of your stack to one side. These automatically take up all remaining space, so if you add one at the end a VStack it will push all your views to the top of the screen:
                    Section {
                        Spacer()
                        Text("First")
                        Text("Second")
                        Text("Third")
                        Spacer()
                    }
                }
                
                ZStack {
                    //We also have ZStack for arranging things by depth – it makes views that overlap. In the case of our two text views, this will make things rather hard to read:
                    Section {
                        Text("This is inside a ZStack")
                        Text("This is inside a ZStack")
                    }
                }
            }
            .navigationTitle("Stack Views")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

#Preview {
    StackView()
}
