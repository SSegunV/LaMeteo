//
//  ForecastBarView.swift
//  LaMeteo
//
//  Created by Victor Jegede on 22/12/2023.
//

import SwiftUI
import Charts
import MapKit

struct ForecastBarView: View {
    @Binding var forecast: ForecastData
        var body: some View {
        Chart {
            BarMark(
                x: .value("Time", forecast.list![0].dtTxt!),
                y: .value("Temperature", forecast.list![0].main!.temp!)
            )
            BarMark(
                x: .value("Time", forecast.list![1].dtTxt!),
                y: .value("Temperature", forecast.list![1].main!.temp!)
            )
            BarMark(
                x: .value("Time", forecast.list![2].dtTxt!),
                y: .value("Temperature", forecast.list![2].main!.temp!)
            )
            BarMark(
                x: .value("Time", forecast.list![3].dtTxt!),
                y: .value("Temperature", forecast.list![3].main!.temp!)
            )
        }
        .frame(width: 320, height: 300)
        .padding()
    }
}

#Preview {
    ForecastBarView(forecast: .constant(ForecastData.sampleData))
}
