//
//  ActivityModel.swift
//  Habit Tracker
//
//  Created by Madhukesh on 26/08/20.
//  Copyright © 2020 Madhukesh. All rights reserved.
//

import SwiftUI

struct ActivityModel: Identifiable,Codable {
    
    let id = UUID()
    let name: String
    let description: String
    var count: Int
}

class Activities: ObservableObject {
    @Published var activities: [ActivityModel] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let activities = UserDefaults.standard.data(forKey: "Activities") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ActivityModel].self, from: activities) {
                self.activities = decoded
                return
            }
        }
        
        self.activities = []
    }
}
