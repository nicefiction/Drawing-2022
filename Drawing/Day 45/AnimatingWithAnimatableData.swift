/// SOURCE:
/// https://www.hackingwithswift.com/books/ios-swiftui/animating-simple-shapes-with-animatabledata

import SwiftUI



struct Trapezoid: Shape {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    var insetAmount: Double
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var animatableData: Double {
        get {
            insetAmount
        }
        set {
            insetAmount = newValue
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func path(in rect: CGRect)
    -> Path {
        
        var path = Path.init()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
    
    
    
    // MARK: - HELPER METHODS
}



struct AnimatingWithAnimatableData: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var insetAmount: Double = 50.00
   
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 300, height: 300 * 0.618)
            .foregroundColor(.indigo)
            .onTapGesture {
                withAnimation {
                    insetAmount = Double.random(in: 1...80)
                }
            }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEWS ///////////////////////////////////////////////////
struct AnimatingWithAnimatableData_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        AnimatingWithAnimatableData()
    }
}
