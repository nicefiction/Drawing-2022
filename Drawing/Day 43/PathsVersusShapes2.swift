/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/paths-vs-shapes-in-swiftui

import SwiftUI



struct AnotherTriangle: Shape {
    
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
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
    
    
    
    // MARK: - HELPER METHODS
}






struct CustomArc: Shape {
   
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    
    
    
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func path(in rect: CGRect)
    -> Path {
        let adjustedStartAngle: Angle = startAngle - Angle.init(degrees: 90.00)
        let adjustedEndAngle: Angle = endAngle - Angle.init(degrees: 90.00)
        
        var path = Path.init()
        // path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2,
                    startAngle: adjustedStartAngle,
                    endAngle: adjustedEndAngle,
                    clockwise: clockwise)
        
        return path
    }
    
    
    
    // MARK: - HELPER METHODS
}






struct PathsVersusShapes2: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack {
            Triangle()
                .stroke(.green, style: StrokeStyle.init(lineWidth: 8.0,
                                                        lineCap: .round,
                                                        lineJoin: .round))
                .frame(width: 200, height: 200)
                .padding(.bottom)
            CustomArc(startAngle: Angle.init(degrees: 0.00),
                      endAngle: Angle.init(degrees: 90.00),
                      clockwise: false)
            .stroke(.orange, style: StrokeStyle.init(lineWidth: 8.0,
                                                     lineCap: .square,
                                                     lineJoin: .bevel))
            .frame(width: 300, height: 300)
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEWS //////////////////////////////////////////
struct PathsVersusShapes2_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        PathsVersusShapes2()
    }
}
