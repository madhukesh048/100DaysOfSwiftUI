//
//  Arrow.swift
//  Drawing
//
//  Created by Madhukesh on 24/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct Arrow: View {
    @State private var lineWidth = 0.5
    
    var body: some View {
         VStack {
                   ArrowDemo(lineWidth: lineWidth)
                       .aspectRatio(0.5, contentMode: .fit)
                       .animation(.default)

                   Stepper("Line Width: \(String(format: "%g", lineWidth as Double))", value: $lineWidth, in: 0.1...0.9, step: 0.1)
               }
               .padding()
    }
}

//struct ArrowDemo: Shape {
//    var lineWidth: Double
//
//    init(lineWidth: Double = 0.5) {
//        self.lineWidth = min(max(lineWidth, 0), 1)
//    }
//
//    var animatableData: Double {
//        get { lineWidth }
//        set { lineWidth = newValue }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        let headHeight = min(rect.size.width / (2 * rect.size.height), 0.5)
//        let inset: CGFloat = CGFloat((1 - lineWidth) / 2)
//
//        var path = Path()
//
//        path.move(to: CGPoint(x: 0.5, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: headHeight))
//        path.addLine(to: CGPoint(x: inset, y: headHeight)) // x
//        path.addLine(to: CGPoint(x: inset, y: 1)) // x
//        path.addLine(to: CGPoint(x: 1 - inset, y: 1)) // x
//        path.addLine(to: CGPoint(x: 1 - inset, y: headHeight)) // x
//        path.addLine(to: CGPoint(x: 1, y: headHeight))
//        path.closeSubpath()
//
//        return path.applying(CGAffineTransform(scaleX: rect.width, y: rect.height))
//    }
//}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow()
    }
}
