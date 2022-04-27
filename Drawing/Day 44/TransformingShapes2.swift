/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/transforming-shapes-using-cgaffinetransform-and-even-odd-fills

import SwiftUI



struct Mandala: Shape {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    /// How much to move this petal away from the center:
    var petalOffset: Double = -50
    /// How wide to make each petal:
    var petalWidth: Double = 100
    
    
    
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func path(in rect: CGRect)
    -> Path {
        
        var path = Path.init()
        
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
            let originalPetal = Path(roundedRect: CGRect(x: petalOffset,
                                                         y: 0,
                                                         width: petalWidth,
                                                         height: petalWidth),
                                     cornerRadius: 50)
//            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 30))
            
            /// apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)
            
            /// add it to our main path
            path.addPath(rotatedPetal)
        }
        
        /// now send the main path back
        return path
    }
    
    
    
    // MARK: - HELPER METHODS
}



struct TransformingShapes2: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var petalOffset: Double = 20.00
    @State private var petalWidth: Double = 10.00
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack() {
            Mandala(petalOffset: petalOffset,
                    petalWidth: petalWidth)
            .stroke(.red, style: StrokeStyle.init(lineWidth: 1.00))
            Text("Petal Offset: \(petalOffset.formatted())")
            Slider(value: $petalOffset,
                   in: 1...100)
            Text("Petal Width: \(petalWidth.formatted())")
                .padding(.top, 30)
            Slider(value: $petalWidth,
                   in: 1...100)
            
        }
        .padding()
        .font(.headline)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}







// PREVIEWS ///////////////////////////////////////////
struct TransformingShapes2_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        TransformingShapes2()
    }
}
