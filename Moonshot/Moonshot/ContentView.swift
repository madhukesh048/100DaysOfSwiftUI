//
//  ContentView.swift
//  Moonshot
//
//  Created by Madhukesh on 17/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ geo in
            Image("example")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width,height: geo.size.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
