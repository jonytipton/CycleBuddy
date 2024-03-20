//
//  MetricsView.swift
//  CycleBuddy Watch App
//
//  Created by Jonathan Tipton on 3/19/24.
//

import SwiftUI

struct MetricsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ElapsedTimeView(
                elapsedTime: 3 * 60 + 15.24)
                .foregroundStyle(Color.yellow)
                .fontWeight(.semibold)
            Text(
                Measurement(
                    value: 47,
                    unit: UnitEnergy.kilocalories
                ).formatted(
                    .measurement(width: .abbreviated,
                                 usage: .workout))
            )
            Text(
                153.formatted(
                    .number.precision(.fractionLength(0)))
                + " bpm"
                )
            Text(
            Measurement(
                value: 515, unit: UnitLength.meters).formatted(
                    .measurement(width: .abbreviated, usage: .road)
                )
            )
        }
        .font(.system(.title, design: .rounded)
            .monospacedDigit()
            .lowercaseSmallCaps())
        .frame(maxWidth: .infinity, alignment: .leading)
        .ignoresSafeArea(edges: .bottom)
        .scenePadding()
    }
}

#Preview {
    MetricsView()
}
