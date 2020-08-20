//
//  AstronautView.swift
//  Moonshot
//
//  Created by Madhukesh on 19/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    VStack(alignment: .center) {
                          Text("Missions of \(self.astronaut.name) ")
                            .foregroundColor(Color.blue)
                          List(self.missions) { mission in
                              Image(mission.image)
                              .resizable()
                              .scaledToFit()
                              .frame(width: 44, height: 44)
                              VStack(alignment: .leading) {
                                  Text(mission.displayName)
                                      .font(.headline)
                                  Text(mission.formattedLaunchDate)
                              }
                          }
                      }
                }
            }
        }
        .navigationBarTitle(Text(self.astronaut.name),displayMode: .inline)
    }
    init(astronaut: Astronaut, missions: [Mission]) {
         self.astronaut = astronaut
         self.missions = missions
         
         var matches = [Mission]()
         
         for mission in missions {
            if mission.crew.first(where: {$0.name == self.astronaut.id}) != nil {
                 matches.append(mission)
             }
         }
         self.missions = matches
     }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts : [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions : [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0],missions: missions)
    }
}
