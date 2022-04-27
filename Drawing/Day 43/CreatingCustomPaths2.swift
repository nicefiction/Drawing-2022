/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-paths-with-swiftui

import SwiftUI

/// OLIVIER:
/// At first I thought I needed to create a `Shape` struct,
/// but Paul created the shape directly inthe `View`:
struct CustomTriangle: Shape {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func path(in rect: CGRect)
    -> Path {
        
        var path = Path.init()
        
        path.move(to: CGPoint(x: 200, y: 200))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 100, y: 300))
        
        
        return path
    }
    
    
    
    // MARK: - HELPER METHODS
}






struct CreatingCustomPaths2: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Path { path in
            
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        }
        .stroke(.blue,
                style: StrokeStyle(lineWidth: 8.0,
                                   lineCap: .round,
                                   lineJoin: .round))
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEWS ////////////////////////////////////////////
struct CreatingCustomPaths2_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        CreatingCustomPaths2()
    }
}
