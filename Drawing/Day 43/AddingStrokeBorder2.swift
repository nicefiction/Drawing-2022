/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/adding-strokeborder-support-with-insettableshape

import SwiftUI






struct Rainbow: InsettableShape {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount: CGFloat = 0.00
    
    
    
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func path(in rect: CGRect)
    -> Path {
        
        let adjustedStartAngle: Angle = startAngle - Angle.init(degrees: 90.00)
        let adjustedEndAngle: Angle = endAngle - Angle.init(degrees: 90.00)
        
        var path = Path.init()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: (rect.width / 2) - insetAmount,
                    startAngle: adjustedStartAngle,
                    endAngle: adjustedEndAngle,
                    clockwise: false)
        
        return path
    }
    
    
    func inset(by amount: CGFloat)
    -> some InsettableShape {
        
        var rainbow = self
        rainbow.insetAmount += amount
        return rainbow
    }
    
    // MARK: - HELPER METHODS
}



struct AddingStrokeBorder2: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Rainbow(startAngle: Angle.degrees(-90.00),
                endAngle: Angle.degrees(90),
                clockwise: false)
//        .stroke(.blue, style: StrokeStyle.init(lineWidth: 33.00,
//                                               lineCap: .square,
//                                               lineJoin: .bevel))
        .strokeBorder(.blue, style: StrokeStyle.init(lineWidth: 33.00,
                                                     lineCap: .square,
                                                     lineJoin: .bevel))
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEWS ///////////////////////////////////////////
struct AddingStrokeBorder2_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        AddingStrokeBorder2()
    }
}
