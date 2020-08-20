//
//  ContentView.swift
//  Moonshot
//
//  Created by Madhukesh on 17/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts:[Astronaut] = Bundle.main.decode("astronauts.json")
    let missions:[Mission] = Bundle.main.decode("missions.json")
    @State private var showCrewNames = false
    var body: some View {
       NavigationView {
           List(missions) { mission in
            NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts,missions: self.missions)) {
                   Image(mission.image)
                       .resizable()
                       .scaledToFit()
                       .frame(width: 44, height: 44)

                   VStack(alignment: .leading) {
                       Text(mission.displayName)
                           .font(.headline)
                        HStack{
                            Text(self.showCrewNames ? "\(mission.crewNames)":"\(mission.formattedLaunchDate)")
                        }
                   }
               }
           }
           .navigationBarTitle("Moonshot")
           .navigationBarItems(trailing:
            Button(action: {
                    self.showCrewNames.toggle()
                    }, label: {
                        Text(self.showCrewNames ? "Show Launch Dates" : "Show Crew Name")
                        .padding(.all, 8)
                        .frame(width: 180)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Capsule())
            }))
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
