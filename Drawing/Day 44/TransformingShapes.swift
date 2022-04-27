/// SOURCE:
///  https://www.hackingwithswift.com/books/ios-swiftui/transforming-shapes-using-cgaffinetransform-and-even-odd-fills

import SwiftUI



struct Flower: Shape {
    
    // MARK: - PROPERTIES
    /// How much to move this petal away from the center
    var petalOffset: Double = 100
    /// How wide to make each petal
    var petalWidth: Double = 100

    
    
    // MARK: - METHODS
    func path(in rect: CGRect) -> Path {
        /// The path that will hold all petals
        var path = Path()

        /// Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0,
                             to: Double.pi * 2,
                             by: Double.pi / 3) {
            /// rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)

            /// move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2,
                                                                    y: rect.height / 2))

            /// create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset,
                                                       y: 0,
                                                       width: petalWidth,
                                                       height: rect.width / 8))

            /// apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)

            /// add it to our main path
            path.addPath(rotatedPetal)
        }

        /// now send the main path back
        return path
    }
}





struct TransformingShapes: View {
    
    // MARK: - STATIC PROPERTIES
    @State private var petalOffset: Double = 50.00
    @State private var petalWidth: Double = 50.00
    
    
    
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack {
            Flower(petalOffset: petalOffset,
                   petalWidth: petalWidth)
            .stroke(lineWidth: 2.00)
            
            Group {
                Text("Offset: \(petalOffset.formatted())")
                Slider(value: $petalOffset,
                       in: -40...40)
                .padding([.bottom])
                
                Text("Width: \(petalWidth.formatted())")
                Slider(value: $petalWidth,
                       in: 0...100)
            }
            .padding(.horizontal)
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct TransformingShapes_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TransformingShapes()
    }
}
