/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/creative-borders-and-fills-using-imagepaint

import SwiftUI



struct UsingImagePaint: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        VStack {
            Text("Green Shed")
                .font(.largeTitle)
                .bold()
                .frame(width: 200, height: 200)
                .padding()
                //.border(.red, width: 20)
                .border(
                    ImagePaint(image: Image("green-shed"), scale: 0.2),
                    width: 20.0
                )
            Text("Green Shed")
                .font(.largeTitle)
                .bold()
                .frame(width: 200, height: 200)
                .padding()
                //.border(.red, width: 20)
                .border(
                    ImagePaint(image: Image("green-shed"),
                               /// `0` means “start” and `1` means “end”.
                               /// For example, this will show the entire width of our example image,
                               /// but only the middle half:
                               sourceRect: CGRect.init(x: 0, y: 0.25,
                                                       width: 2, height: 0.5),
                               scale: 0.25),
                    width: 20.0
                )
            /// `ImagePaint` can be used for view backgrounds and also shape strokes:
            ZStack {
                Text("Green Shed")
                    .font(.largeTitle)
                    .bold()
                Capsule()
                    .strokeBorder(
                        ImagePaint(image: Image("green-shed"),
                                   sourceRect: CGRect.init(x: 0.00, y: 0.15,
                                                           width: 1.00, height: 0.50),
                                   /// `x: 0 `Start from the top left edge.
                                   /// `y: 0.15`Form the top, start from 0.15. So, miss the first 15% of the picture.
                                   /// `width: 1.00` Read the full width of teh picture.
                                   /// `height: 0.50` So, read from 0.15, down to 0.50, so 0.65 in total.
                                   /// >> So the middle of the picture, ignoring top and bottom,
                                   /// full left and right.
                                   scale: 0.25),
                        lineWidth: 20.0
                    )
                .padding()
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEWS /////////////////
struct UsingImagePaint_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        UsingImagePaint()
    }
}
