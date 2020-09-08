//
//  ContentView.swift
//  Bookworm
//
//  Created by Madhukesh on 08/09/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
         if sizeClass == .compact {
                  return AnyView(VStack {
                      Text("Active size class:")
                      Text("COMPACT")
                  }
                  .font(.largeTitle))
              } else {
                  return AnyView(HStack {
                      Text("Active size class:")
                      Text("REGULAR")
                  }
                  .font(.largeTitle))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
