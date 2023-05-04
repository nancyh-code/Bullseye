//
//  Shapes.swift
//  Bullseye
//
//  Created by Nancy Hernandez Yanez on 20-04-23.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShapes = true
  var body: some View {
    VStack {
      if !wideShapes {
        Circle()
          .inset(by: 10)
          .stroke(Color.blue, lineWidth: 20)
          .frame(width: 200, height: 100.0)
          .background(Color.green)
          .transition(.scale)
      }

      RoundedRectangle(cornerRadius: 20)
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
//        .animation(.easeInOut, value: wideShapes)
      Capsule()
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Ellipse()
        .fill(Color.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Button("Animate!") {
        withAnimation {
          wideShapes.toggle()
        }
       
        
      }
    }
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
