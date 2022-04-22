/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/paths-vs-shapes-in-swiftui

import SwiftUI


struct Triangle: Shape {
    
    func path(in rect: CGRect)
    -> Path {
        
        var path = Path.init()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}





struct Arc: Shape {
    
    // MARK: - PROPERTIES
    var startAngle: Angle
    var endAngle: Angle
    var isClockWise: Bool
    
    
    
    // MARK: - METHODS
    func path(in rect: CGRect)
    -> Path {
        
        let adjustForRotation: Angle = Angle.init(degrees: 90.00)
        let adjustedStartAngle: Angle = startAngle - adjustForRotation
        let adjustedEndAngle: Angle = endAngle - adjustForRotation
        var path = Path.init()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width/2,
                    startAngle: adjustedStartAngle,
                    endAngle: adjustedEndAngle,
                    clockwise: !isClockWise)
        
        return path
    }
}





struct PathsVersusShapes: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        Triangle()
            .stroke(.red, style: StrokeStyle.init(lineWidth: 20))
//            .stroke(.blue, style: StrokeStyle.init(lineWidth: 20,
//                                                   lineCap: .round,
//                                                   lineJoin: .round))
            .frame(width: 200, height: 200)
        
        
        Arc(startAngle: Angle.init(degrees: 0.00),
            endAngle: Angle.init(degrees: 90.00),
            isClockWise: true)
        .stroke(style: StrokeStyle.init(lineWidth: 15))
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct PathsVersusShapes_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PathsVersusShapes()
    }
}
