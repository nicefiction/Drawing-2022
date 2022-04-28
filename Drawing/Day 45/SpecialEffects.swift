//
//  SpecialEffects.swift
//  Drawing
//
//  Created by Olivier Van hamme on 28/04/2022.
//

import SwiftUI

struct SpecialEffects: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var scaleAmount: Double = 10.00
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
//        ZStack {
//            Image("green-shed")
//            Color.red
//                .blendMode(.multiply)
//        }
        
//        Image("green-shed")
//            .resizable()
//            .scaledToFit()
//            .colorMultiply(.red)
        
        GeometryReader { (geometryProxy: GeometryProxy) in
            VStack {
                ZStack {
                    Circle()
                        // .foregroundColor(.red)
                        .foregroundColor(Color(red: 1, green: 0, blue: 0))
                        .frame(width: 10 * scaleAmount)
                        .position(x: (geometryProxy.size.width / 2) - 75,
                                  y: (geometryProxy.size.height / 2) - 120)
                    .blendMode(.screen)
                    Circle()
                        // .foregroundColor(.green)
                        .foregroundColor(Color(red: 0, green: 1, blue: 0))
                        .frame(width: 10 * scaleAmount)
                        .position(x: (geometryProxy.size.width / 2) + 75,
                                  y: (geometryProxy.size.height / 2) - 120)
                    .blendMode(.screen)
                    Circle()
                        // .foregroundColor(.blue)
                        .foregroundColor(Color(red: 0, green: 0, blue: 1))
                        .frame(width: 10 * scaleAmount)
                    .blendMode(.screen)
                }
            }
            Slider(value: $scaleAmount, in: 1...20)
                .padding()
        }
        .preferredColorScheme(.dark)
        
/// PAUL HUDSON:
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(.red)
//                    .frame(width: 200 * scaleAmount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(.green)
//                    .frame(width: 200 * scaleAmount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(.blue)
//                    .frame(width: 200 * scaleAmount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
//
//            Slider(value: $scaleAmount)
//                .padding()
//        }
//        .preferredColorScheme(.dark)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEWS //////////////////////////////////////
struct SpecialEffects_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        SpecialEffects()
    }
}
