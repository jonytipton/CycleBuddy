//
//  SummaryView.swift
//  CycleBuddy Watch App
//
//  Created by Jonathan Tipton on 3/19/24.
//

import HealthKit
import SwiftUI

struct SummaryView: View {
    @State private var durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                SummaryMetricView(
                    title: "Total Time",
                    value: durationFormatter.string(from: 30 * 60 + 15) ?? "")
                .tint(.yellow)

                SummaryMetricView(
                    title: "Total Distance",
                    value: Measurement(
                        value: 1625,
                        unit: UnitLength.meters
                    ).formatted(
                        .measurement(
                            width: .abbreviated,
                            usage: .road
                        )
                    )
                )
                .tint(.green)
                SummaryMetricView(
                    title: "Total Energy",
                    value: Measurement(
                        value: 96,
                        unit: UnitEnergy.kilocalories
                    ).formatted(
                        .measurement(
                            width: .abbreviated,
                            usage: .workout,
                            numberFormatStyle: .number.precision(.fractionLength(0))
                        )
                    )
                )
                .tint(Color.pink)
                SummaryMetricView(
                    title: "Avg. Heart Rate",
                    value: 143
                        .formatted(.number.precision(.fractionLength(0)))
                    + " bpm"
                ).tint(Color.red)
                
                Text("Activity Rings")
                ActivityRingsView(healthStore: HKHealthStore()).frame(width: 50, height: 50)
                
                Button("Done") {
                }
                .scenePadding()
            }
            .navigationTitle("Summary")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SummaryMetricView: View {
    var title: String
    var value: String
    
    var body: some View {
        Text(title)
        Text(value)
            .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
            .foregroundStyle(.tint)
        Divider()
    }
}

#Preview {
    SummaryView()
}
