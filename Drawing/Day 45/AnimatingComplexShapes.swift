/// SOURCE:
/// 

import SwiftUI



struct Checkerboard: Shape {
    
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    var numberOfRows: Int
    var numberOfColumns: Int
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(numberOfRows), Double(numberOfColumns))
        }
        set {
            numberOfRows = Int(newValue.first)
            numberOfColumns = Int(newValue.second)
        }
    }
    /*
     var animatableData: AnimatablePair<Double, Double> {
         get {
            AnimatablePair(Double(rows), Double(columns))
         }

         set {
             rows = Int(newValue.first)
             columns = Int(newValue.second)
         }
     }
     */
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func path(in rect: CGRect)
    -> Path {
        
        let rowSize = rect.height / Double(numberOfRows)
        let columnSize = rect.width / Double(numberOfColumns)
        
        var path = Path.init()
        
        for eachRow in 0..<numberOfRows {
            for eachColumn in 0..<numberOfColumns {
                if (eachRow + eachColumn).isMultiple(of: 2) {
                    let startX = columnSize * Double(eachColumn)
                    let startY = rowSize * Double(eachRow)
                    
                    let cgRect = CGRect.init(x: startX,
                                             y: startY,
                                             width: columnSize,
                                             height: rowSize)
                    path.addRect(cgRect)
                }
            }
        }
        
        return path
    }
    
    
    
    // MARK: - HELPER METHODS
}






struct AnimatingComplexShapes: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var row: Int = 4
    @State private var column: Int = 4
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        GeometryReader { (geometryProxy: GeometryProxy) in
            Checkerboard(numberOfRows: row,
                         numberOfColumns: column)
            .frame(width: geometryProxy.size.width,
                   height: geometryProxy.size.height/2)
            .onTapGesture {
                withAnimation(.linear(duration: 3.00)) {
                    row = 8
                    column = 8
                }
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEWS //////////////////////////////////////////////
struct AnimatingComplexShapes_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        AnimatingComplexShapes()
    }
}
