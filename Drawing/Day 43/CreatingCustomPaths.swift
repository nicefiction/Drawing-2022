/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-paths-with-swiftui

import SwiftUI



struct CreatingCustomPaths: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
//        Path { path in
//
//            path.move(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
//        }
//        // .fill(.blue)
//        .stroke(.blue, lineWidth: 20)
        
        Path { path in
            
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        }
        .stroke(.blue,
                style: StrokeStyle.init(lineWidth: 20,
                                        lineCap: .round,
                                        lineJoin: .round))
        /// Using rounded corners
        /// solves the problem of our rough edges,
        /// but it doesn’t solve the problem of fixed coordinates.
        /// For that we need to move on from paths
        /// and look at something more complex:
        /// shapes.
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct CreatingCustomPaths_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CreatingCustomPaths()
    }
}
