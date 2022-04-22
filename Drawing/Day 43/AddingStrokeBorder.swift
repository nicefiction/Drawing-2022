/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/adding-strokeborder-support-with-insettableshape

import SwiftUI


struct RainbowArc: InsettableShape {
    
    // MARK: - PROPERTIES
    let startAngle: Angle
    let endAngle: Angle
    let isClockWise: Bool
    var insetAmount = 0.0
    
    
    
    // MARK: - METHODS
    func path(in rect: CGRect)
    -> Path {
        
        let adjustForRotation: Angle = Angle.init(degrees: 90.00)
        let adjustedStartAngle = startAngle - adjustForRotation
        let adjustedEndAngle = endAngle - adjustForRotation
        
        var path = Path.init()
        
//        path.move(to: CGPoint(x: rect.minX,
//                              y: rect.midY))
//        path.addLine(to: CGPoint(x: rect.midX,
//                                 y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX,
//                                 y: rect.midY))
        
        path.addArc(center: CGPoint.init(x: rect.midX, y: rect.midY),
                    radius: (rect.width / 2) - insetAmount,
                    startAngle: adjustedStartAngle,
                    endAngle: adjustedEndAngle,
                    clockwise: !isClockWise)
        return path
    }
    
    
    func inset(by amount: CGFloat)
    -> some InsettableShape {
        
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}



struct AddingStrokeBorder: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        RainbowArc(startAngle: Angle.init(degrees: -90.00),
                   endAngle: Angle.init(degrees: 90.00),
                   isClockWise: true)
//        .stroke(.blue,
//                style: StrokeStyle.init(lineWidth: 40))
        .strokeBorder(.blue,
                      style: StrokeStyle.init(lineWidth: 40.00))
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct AddingStrokeBorder_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AddingStrokeBorder()
    }
}
