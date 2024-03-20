//
//  ContentView.swift
//  CycleBuddy Watch App
//
//  Created by Jonathan Tipton on 3/19/24.
//

import HealthKit
import SwiftUI

struct StartView: View {
    var workoutTypes: [HKWorkoutActivityType] = [.cycling, .running, .walking]
    
    var body: some View {
        NavigationStack {
            List(workoutTypes) { workoutType in
                NavigationLink(workoutType.name, destination: SessionPagingView()
                ).padding(
                    EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
            }
            .listStyle(.carousel)
            .navigationTitle("Workouts")
        }
    }
}

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }
    
    var name:String {
        switch self {
        case .running:
            return "Run"
        case .cycling:
            return "Bike"
        case .walking:
            return "Walk"
        default:
            return ""
        }
    }
}


#Preview {
    StartView()
}
