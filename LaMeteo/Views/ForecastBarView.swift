//
//  ForecastBarView.swift
//  LaMeteo
//
//  Created by Segun Sinclair on 22/12/2023.
//

import SwiftUI
import Charts
import MapKit

struct ForecastBarView: View {
    @Binding var forecast: ForecastData
    
    var body: some View {
        Chart {
            ForEach(0..<min(8, forecast.list?.count ?? 0), id: \.self) { index in
                if let dtTxt = forecast.list?[index].dtTxt,
                   let hour = extractHour(from: dtTxt),
                   let temperature = forecast.list?[index].main?.temp {
                    
                    BarMark(
                        x: .value("Time", "\(hour):00"),
                        y: .value("Temperature", temperature)
                    )
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 6/7, height: UIScreen.main.bounds.height * 1.1/3)
        .padding()
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 10, style: .continuous)
        )
        .foregroundStyle(.teal)
        .chartYScale(domain: [-60, 60])
        .chartYAxis {
            AxisMarks(
                values: .automatic(desiredCount: 9)
            )
        }
    }
}

#Preview {
    ForecastBarView(forecast: .constant(ForecastData.sampleData))
}
